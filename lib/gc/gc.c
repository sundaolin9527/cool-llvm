#include "gc.h"

#include <limits.h>
#include <stdint.h>
#include <string.h>

#if defined(_WIN32)
  #define WIN32_LEAN_AND_MEAN
  #include <windows.h>
#else
  #include <sys/mman.h>
  #include <unistd.h>
#endif

#define COOL_GC_ALIGN ((size_t)sizeof(void*))
#define COOL_GC_MIN_THRESHOLD ((size_t)64 * 1024)
#define COOL_GC_STEP_BUDGET 32u
#define COOL_GC_SWEEP_BUDGET 32u

#define COOL_GC_COLOR_WHITE0 0x01u
#define COOL_GC_COLOR_WHITE1 0x02u
#define COOL_GC_COLOR_BLACK  0x04u
#define COOL_GC_COLOR_GRAY   0x08u
#define COOL_GC_COLOR_MASK   (COOL_GC_COLOR_WHITE0 | COOL_GC_COLOR_WHITE1 | COOL_GC_COLOR_BLACK | COOL_GC_COLOR_GRAY)

#define COOL_BLOCK_MAGIC_MANAGED 0x43474d31u
#define COOL_BLOCK_MAGIC_RAW     0x43524131u

typedef struct CoolRawHeader {
  uint32_t magic;
  uint32_t reserved;
  size_t mapping_size;
  struct CoolRawHeader* prev;
  struct CoolRawHeader* next;
} CoolRawHeader;

typedef struct CoolGCHeader {
  uint32_t magic;
  uint8_t marked;
  uint8_t flags;
  uint16_t reserved0;
  size_t payload_size;
  size_t mapping_size;
  struct CoolGCHeader* alloc_prev;
  struct CoolGCHeader* alloc_next;
  struct CoolGCHeader* gray_next;
  struct CoolGCHeader* sweep_cursor_next;
} CoolGCHeader;

typedef struct CoolGCRoot {
  void** slot;
  struct CoolGCRoot* next;
} CoolGCRoot;

typedef struct CoolGCContext {
  CoolGCHeader* objects_head;
  CoolGCHeader* gray_head;
  CoolGCHeader* gray_tail;
  CoolGCHeader* sweep_cursor;
  CoolGCRoot* roots;
  CoolRawHeader* raw_head;
  size_t total_managed_bytes;
  size_t live_managed_bytes;
  size_t allocation_count;
  size_t collection_count;
  size_t reclaimed_objects;
  size_t reclaimed_bytes;
  size_t threshold;
  uint8_t current_white;
  uint8_t initialized;
  uint8_t stack_direction;
  uint8_t stack_roots_enabled;
  uint8_t reserved0;
  void* stack_anchor;
  CoolGCState state;
} CoolGCContext;

static CoolGCContext g_cool_gc = {
  NULL, NULL, NULL, NULL, NULL, NULL,
  0, 0, 0, 0, 0, 0,
  COOL_GC_MIN_THRESHOLD,
  COOL_GC_COLOR_WHITE0,
  0, 0, 1, 0,
  NULL,
  COOL_GC_PAUSE
};

static void cool_gc_unlink_object(CoolGCHeader* header);
static void cool_gc_destroy_object(CoolGCHeader* header);

static size_t cool_gc_align_up(size_t value, size_t alignment)
{
  return (value + alignment - 1u) & ~(alignment - 1u);
}

static size_t cool_gc_other_white(const CoolGCContext* gc)
{
  return gc->current_white == COOL_GC_COLOR_WHITE0 ? COOL_GC_COLOR_WHITE1 : COOL_GC_COLOR_WHITE0;
}

static void* cool_os_alloc(size_t size)
{
  if (size == 0u) {
    size = COOL_GC_ALIGN;
  }
#if defined(_WIN32)
  return VirtualAlloc(NULL, size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
#else
  void* ptr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  return ptr == MAP_FAILED ? NULL : ptr;
#endif
}

static void cool_os_free(void* ptr, size_t size)
{
  if (!ptr) {
    return;
  }
#if defined(_WIN32)
  (void)size;
  VirtualFree(ptr, 0, MEM_RELEASE);
#else
  munmap(ptr, size);
#endif
}

static void cool_gc_record_stack_anchor(void)
{
  uintptr_t probe = 0u;
  if (!g_cool_gc.stack_anchor) {
    g_cool_gc.stack_anchor = &probe;
    g_cool_gc.stack_direction = 0u;
    return;
  }

  if (g_cool_gc.stack_direction == 0u) {
    uintptr_t anchor = (uintptr_t)g_cool_gc.stack_anchor;
    uintptr_t current = (uintptr_t)&probe;
    g_cool_gc.stack_direction = current < anchor ? 1u : 2u;
  }
}

static void cool_gc_ensure_initialized(void)
{
  if (g_cool_gc.initialized) {
    return;
  }
  cool_gc_record_stack_anchor();
  g_cool_gc.threshold = COOL_GC_MIN_THRESHOLD;
  g_cool_gc.current_white = COOL_GC_COLOR_WHITE0;
  g_cool_gc.state = COOL_GC_PAUSE;
  g_cool_gc.initialized = 1u;
}

static CoolRawHeader* cool_raw_header_from_payload(void* ptr)
{
  if (!ptr) {
    return NULL;
  }
  return ((CoolRawHeader*)ptr) - 1;
}

static CoolRawHeader* cool_raw_find_header_from_payload(const void* ptr)
{
  CoolRawHeader* header = g_cool_gc.raw_head;
  while (header) {
    if ((const void*)(header + 1) == ptr) {
      return header;
    }
    header = header->next;
  }
  return NULL;
}

static CoolGCHeader* cool_gc_header_from_payload(const void* ptr)
{
  if (!ptr) {
    return NULL;
  }
  return ((CoolGCHeader*)ptr) - 1;
}

static void* cool_gc_payload_from_header(CoolGCHeader* header)
{
  return (void*)(header + 1);
}

static void cool_gc_list_push_gray(CoolGCHeader* header)
{
  header->gray_next = NULL;
  if (g_cool_gc.gray_tail) {
    g_cool_gc.gray_tail->gray_next = header;
  } else {
    g_cool_gc.gray_head = header;
  }
  g_cool_gc.gray_tail = header;
}

static CoolGCHeader* cool_gc_list_pop_gray(void)
{
  CoolGCHeader* header = g_cool_gc.gray_head;
  if (!header) {
    return NULL;
  }
  g_cool_gc.gray_head = header->gray_next;
  if (!g_cool_gc.gray_head) {
    g_cool_gc.gray_tail = NULL;
  }
  header->gray_next = NULL;
  return header;
}

static void cool_gc_make_white(CoolGCHeader* header)
{
  header->marked &= (uint8_t)~COOL_GC_COLOR_MASK;
  header->marked |= g_cool_gc.current_white;
}

static int cool_gc_is_collectable_white(const CoolGCHeader* header)
{
  return (header->marked & cool_gc_other_white(&g_cool_gc)) != 0u;
}

static int cool_gc_is_current_white(const CoolGCHeader* header)
{
  return (header->marked & g_cool_gc.current_white) != 0u;
}

static int cool_gc_is_black(const CoolGCHeader* header)
{
  return (header->marked & COOL_GC_COLOR_BLACK) != 0u;
}

static int cool_gc_is_gray(const CoolGCHeader* header)
{
  return (header->marked & COOL_GC_COLOR_GRAY) != 0u;
}

static void cool_gc_mark_gray(CoolGCHeader* header)
{
  if (!header) {
    return;
  }
  if (cool_gc_is_gray(header) || cool_gc_is_black(header)) {
    return;
  }
  if (!cool_gc_is_collectable_white(header)) {
    return;
  }

  header->marked &= (uint8_t)~COOL_GC_COLOR_MASK;
  header->marked |= COOL_GC_COLOR_GRAY;
  cool_gc_list_push_gray(header);
}

static CoolGCHeader* cool_gc_find_header_for_pointer(const void* ptr)
{
  const uintptr_t candidate = (uintptr_t)ptr;
  CoolGCHeader* header = g_cool_gc.objects_head;

  while (header) {
    uintptr_t begin = (uintptr_t)cool_gc_payload_from_header(header);
    uintptr_t end = begin + header->payload_size;
    if (candidate >= begin && candidate < end) {
      return header;
    }
    header = header->alloc_next;
  }

  return NULL;
}

static CoolGCHeader* cool_gc_find_header_from_payload(const void* ptr)
{
  CoolGCHeader* header = g_cool_gc.objects_head;
  while (header) {
    if (cool_gc_payload_from_header(header) == ptr) {
      return header;
    }
    header = header->alloc_next;
  }
  return NULL;
}

static void cool_gc_mark_pointer_candidate(const void* ptr)
{
  CoolGCHeader* header = cool_gc_find_header_for_pointer(ptr);
  if (!header) {
    return;
  }
  cool_gc_mark_gray(header);
}

static void cool_gc_scan_words(const void* begin, const void* end)
{
  uintptr_t start = (uintptr_t)begin;
  uintptr_t finish = (uintptr_t)end;

  if (finish < start) {
    uintptr_t tmp = start;
    start = finish;
    finish = tmp;
  }

  start = cool_gc_align_up(start, COOL_GC_ALIGN);
  finish &= ~(uintptr_t)(COOL_GC_ALIGN - 1u);

  for (uintptr_t cursor = start; cursor + sizeof(uintptr_t) <= finish; cursor += sizeof(uintptr_t)) {
    uintptr_t candidate = *(const uintptr_t*)cursor;
    if (candidate == 0u) {
      continue;
    }
    cool_gc_mark_pointer_candidate((const void*)candidate);
  }
}

static void cool_gc_scan_object_payload(CoolGCHeader* header)
{
  void* payload = cool_gc_payload_from_header(header);
  cool_gc_scan_words(payload, (const uint8_t*)payload + header->payload_size);
}

static void cool_gc_mark_registered_roots(void)
{
  CoolGCRoot* root = g_cool_gc.roots;
  while (root) {
    if (root->slot && *root->slot) {
      cool_gc_mark_pointer_candidate(*root->slot);
    }
    root = root->next;
  }
}

static void cool_gc_mark_stack_roots(void)
{
  uintptr_t probe = 0u;
  if (!g_cool_gc.stack_roots_enabled) {
    return;
  }
  cool_gc_record_stack_anchor();
  if (!g_cool_gc.stack_anchor) {
    return;
  }

  if (g_cool_gc.stack_direction == 1u) {
    cool_gc_scan_words(&probe, g_cool_gc.stack_anchor);
  } else {
    cool_gc_scan_words(g_cool_gc.stack_anchor, &probe);
  }
}

static void cool_gc_scan_all_roots(void)
{
  cool_gc_mark_registered_roots();
  cool_gc_mark_stack_roots();
}

static void cool_gc_trace_header(CoolGCHeader* header)
{
  if (!header) {
    return;
  }
  if (!cool_gc_is_gray(header)) {
    return;
  }

  cool_gc_scan_object_payload(header);
  header->marked &= (uint8_t)~COOL_GC_COLOR_MASK;
  header->marked |= COOL_GC_COLOR_BLACK;
}

static void cool_gc_rescan_black_heap(void)
{
  CoolGCHeader* header = g_cool_gc.objects_head;
  while (header) {
    if (cool_gc_is_black(header) || cool_gc_is_current_white(header)) {
      cool_gc_scan_object_payload(header);
    }
    header = header->alloc_next;
  }
}

static void cool_gc_start_cycle(void)
{
  g_cool_gc.current_white = (uint8_t)cool_gc_other_white(&g_cool_gc);
  g_cool_gc.gray_head = NULL;
  g_cool_gc.gray_tail = NULL;
  g_cool_gc.sweep_cursor = NULL;
  cool_gc_scan_all_roots();
  g_cool_gc.state = COOL_GC_PROPAGATE;
}

static void cool_gc_finish_atomic(void)
{
  g_cool_gc.sweep_cursor = g_cool_gc.objects_head;
  g_cool_gc.state = COOL_GC_SWEEP;
}

static void cool_gc_run_atomic(void)
{
  cool_gc_scan_all_roots();
  cool_gc_rescan_black_heap();
  while (g_cool_gc.gray_head) {
    CoolGCHeader* header = cool_gc_list_pop_gray();
    cool_gc_trace_header(header);
  }
  cool_gc_finish_atomic();
}

static void cool_gc_run_full_collection(void)
{
  int progress;
  CoolGCHeader* header;
  CoolGCHeader* next;

  g_cool_gc.current_white = (uint8_t)cool_gc_other_white(&g_cool_gc);
  g_cool_gc.gray_head = NULL;
  g_cool_gc.gray_tail = NULL;
  g_cool_gc.sweep_cursor = NULL;
  g_cool_gc.state = COOL_GC_PROPAGATE;

  do {
    progress = 0;
    cool_gc_scan_all_roots();
    cool_gc_rescan_black_heap();
    while (g_cool_gc.gray_head) {
      CoolGCHeader* gray = cool_gc_list_pop_gray();
      cool_gc_trace_header(gray);
      progress = 1;
    }
  } while (progress);

  header = g_cool_gc.objects_head;
  while (header) {
    next = header->alloc_next;
    if (cool_gc_is_collectable_white(header)) {
      cool_gc_unlink_object(header);
      cool_gc_destroy_object(header);
    } else {
      cool_gc_make_white(header);
    }
    header = next;
  }

  g_cool_gc.collection_count += 1u;
  g_cool_gc.live_managed_bytes = g_cool_gc.total_managed_bytes;
  g_cool_gc.threshold = g_cool_gc.live_managed_bytes * 2u;
  if (g_cool_gc.threshold < COOL_GC_MIN_THRESHOLD) {
    g_cool_gc.threshold = COOL_GC_MIN_THRESHOLD;
  }
  g_cool_gc.state = COOL_GC_PAUSE;
}

static void cool_gc_unlink_object(CoolGCHeader* header)
{
  if (header->alloc_prev) {
    header->alloc_prev->alloc_next = header->alloc_next;
  } else {
    g_cool_gc.objects_head = header->alloc_next;
  }

  if (header->alloc_next) {
    header->alloc_next->alloc_prev = header->alloc_prev;
  }
}

static void cool_gc_destroy_object(CoolGCHeader* header)
{
  if (!header) {
    return;
  }

  g_cool_gc.total_managed_bytes -= header->payload_size;
  g_cool_gc.reclaimed_bytes += header->payload_size;
  g_cool_gc.reclaimed_objects += 1u;
  cool_os_free(header, header->mapping_size);
}

static size_t cool_gc_sweep_some(size_t budget)
{
  size_t swept = 0u;

  while (g_cool_gc.sweep_cursor && swept < budget) {
    CoolGCHeader* header = g_cool_gc.sweep_cursor;
    g_cool_gc.sweep_cursor = header->alloc_next;

    if (cool_gc_is_collectable_white(header)) {
      cool_gc_unlink_object(header);
      cool_gc_destroy_object(header);
    } else {
      cool_gc_make_white(header);
    }

    swept += 1u;
  }

  if (!g_cool_gc.sweep_cursor) {
    g_cool_gc.collection_count += 1u;
    g_cool_gc.live_managed_bytes = g_cool_gc.total_managed_bytes;
    g_cool_gc.threshold = g_cool_gc.live_managed_bytes * 2u;
    if (g_cool_gc.threshold < COOL_GC_MIN_THRESHOLD) {
      g_cool_gc.threshold = COOL_GC_MIN_THRESHOLD;
    }
    g_cool_gc.state = COOL_GC_PAUSE;
  }

  return swept;
}

static int cool_gc_step_internal(void)
{
  size_t budget = COOL_GC_STEP_BUDGET;

  if (!g_cool_gc.initialized) {
    cool_gc_ensure_initialized();
  }

  while (budget > 0u) {
    if (g_cool_gc.state == COOL_GC_PAUSE) {
      cool_gc_start_cycle();
      return 0;
    }

    cool_gc_rescan_black_heap();
    if (g_cool_gc.gray_head && g_cool_gc.state == COOL_GC_SWEEP) {
      g_cool_gc.state = COOL_GC_PROPAGATE;
    }

    if (g_cool_gc.state == COOL_GC_PROPAGATE) {
      CoolGCHeader* header = cool_gc_list_pop_gray();
      if (!header) {
        g_cool_gc.state = COOL_GC_ATOMIC;
        continue;
      }
      cool_gc_trace_header(header);
      budget -= 1u;
      continue;
    }

    if (g_cool_gc.state == COOL_GC_ATOMIC) {
      cool_gc_run_atomic();
      return 0;
    }

    if (g_cool_gc.state == COOL_GC_SWEEP) {
      size_t swept = cool_gc_sweep_some(COOL_GC_SWEEP_BUDGET);
      if (swept == 0u) {
        return 0;
      }
      if (budget > swept) {
        budget -= swept;
      } else {
        budget = 0u;
      }
      continue;
    }

    return 0;
  }

  return g_cool_gc.state == COOL_GC_PAUSE ? 1 : 0;
}

static void cool_gc_maybe_collect_after_alloc(void)
{
  if (g_cool_gc.total_managed_bytes < g_cool_gc.threshold) {
    return;
  }

  (void)cool_gc_step_internal();
}

void cool_gc_runtime_init(void)
{
  cool_gc_ensure_initialized();
}

void cool_gc_runtime_shutdown(void)
{
  CoolGCHeader* header;
  CoolGCRoot* root;

  while (g_cool_gc.objects_head) {
    header = g_cool_gc.objects_head;
    g_cool_gc.objects_head = header->alloc_next;
    cool_gc_destroy_object(header);
  }

  while (g_cool_gc.roots) {
    root = g_cool_gc.roots;
    g_cool_gc.roots = root->next;
    cool_raw_free(root);
  }

  while (g_cool_gc.raw_head) {
    CoolRawHeader* header = g_cool_gc.raw_head;
    g_cool_gc.raw_head = header->next;
    cool_os_free(header, header->mapping_size);
  }

  g_cool_gc.gray_head = NULL;
  g_cool_gc.gray_tail = NULL;
  g_cool_gc.sweep_cursor = NULL;
  g_cool_gc.live_managed_bytes = 0u;
  g_cool_gc.total_managed_bytes = 0u;
  g_cool_gc.state = COOL_GC_PAUSE;
}

void cool_gc_force_full(void)
{
  cool_gc_ensure_initialized();
  cool_gc_run_full_collection();
}

int cool_gc_step(void)
{
  return cool_gc_step_internal();
}

void cool_gc_set_stack_roots_enabled(int enabled)
{
  g_cool_gc.stack_roots_enabled = enabled ? 1u : 0u;
}

void* cool_gc_malloc(size_t size)
{
  CoolGCHeader* header;
  size_t payload_size;
  size_t mapping_size;

  cool_gc_ensure_initialized();

  payload_size = cool_gc_align_up(size == 0u ? 1u : size, COOL_GC_ALIGN);
  mapping_size = cool_gc_align_up(sizeof(CoolGCHeader) + payload_size, 4096u);
  header = (CoolGCHeader*)cool_os_alloc(mapping_size);
  if (!header) {
    cool_gc_force_full();
    header = (CoolGCHeader*)cool_os_alloc(mapping_size);
    if (!header) {
      return NULL;
    }
  }

  memset(header, 0, sizeof(*header));
  header->magic = COOL_BLOCK_MAGIC_MANAGED;
  header->payload_size = payload_size;
  header->mapping_size = mapping_size;
  header->marked = g_cool_gc.current_white;
  header->alloc_prev = NULL;
  header->alloc_next = g_cool_gc.objects_head;
  if (g_cool_gc.objects_head) {
    g_cool_gc.objects_head->alloc_prev = header;
  }
  g_cool_gc.objects_head = header;

  g_cool_gc.total_managed_bytes += payload_size;
  g_cool_gc.live_managed_bytes = g_cool_gc.total_managed_bytes;
  g_cool_gc.allocation_count += 1u;

  memset(cool_gc_payload_from_header(header), 0, payload_size);
  cool_gc_maybe_collect_after_alloc();
  return cool_gc_payload_from_header(header);
}

void* cool_gc_calloc(size_t count, size_t size)
{
  if (count != 0u && size > SIZE_MAX / count) {
    return NULL;
  }
  return cool_gc_malloc(count * size);
}

void cool_gc_free(void* ptr)
{
  CoolGCHeader* header;

  if (!ptr) {
    return;
  }

  header = cool_gc_header_from_payload(ptr);
  if (header->magic != COOL_BLOCK_MAGIC_MANAGED) {
    return;
  }

  cool_gc_unlink_object(header);
  cool_gc_destroy_object(header);
}

int cool_gc_is_managed_pointer(const void* ptr)
{
  if (!ptr) {
    return 0;
  }
  return cool_gc_find_header_from_payload(ptr) != NULL;
}

int cool_gc_contains_pointer(const void* ptr)
{
  return cool_gc_find_header_for_pointer(ptr) != NULL;
}

void cool_gc_register_root(void** slot)
{
  CoolGCRoot* root;

  if (!slot) {
    return;
  }

  root = (CoolGCRoot*)cool_raw_malloc(sizeof(CoolGCRoot));
  if (!root) {
    return;
  }
  root->slot = slot;
  root->next = g_cool_gc.roots;
  g_cool_gc.roots = root;
}

void cool_gc_unregister_root(void** slot)
{
  CoolGCRoot* current = g_cool_gc.roots;
  CoolGCRoot* previous = NULL;

  while (current) {
    if (current->slot == slot) {
      if (previous) {
        previous->next = current->next;
      } else {
        g_cool_gc.roots = current->next;
      }
      cool_raw_free(current);
      return;
    }
    previous = current;
    current = current->next;
  }
}

void cool_gc_get_stats(CoolGCStats* out_stats)
{
  if (!out_stats) {
    return;
  }

  out_stats->total_managed_bytes = g_cool_gc.total_managed_bytes;
  out_stats->live_managed_bytes = g_cool_gc.live_managed_bytes;
  out_stats->allocation_count = g_cool_gc.allocation_count;
  out_stats->collection_count = g_cool_gc.collection_count;
  out_stats->reclaimed_objects = g_cool_gc.reclaimed_objects;
  out_stats->reclaimed_bytes = g_cool_gc.reclaimed_bytes;
  out_stats->current_white = g_cool_gc.current_white;
  out_stats->state = (int)g_cool_gc.state;
}

void* cool_raw_malloc(size_t size)
{
  CoolRawHeader* header;
  size_t payload_size;
  size_t mapping_size;

  payload_size = cool_gc_align_up(size == 0u ? 1u : size, COOL_GC_ALIGN);
  mapping_size = cool_gc_align_up(sizeof(CoolRawHeader) + payload_size, 4096u);
  header = (CoolRawHeader*)cool_os_alloc(mapping_size);
  if (!header) {
    return NULL;
  }

  header->magic = COOL_BLOCK_MAGIC_RAW;
  header->reserved = 0u;
  header->mapping_size = mapping_size;
  header->prev = NULL;
  header->next = g_cool_gc.raw_head;
  if (g_cool_gc.raw_head) {
    g_cool_gc.raw_head->prev = header;
  }
  g_cool_gc.raw_head = header;
  memset(header + 1, 0, payload_size);
  return (void*)(header + 1);
}

void* cool_raw_calloc(size_t count, size_t size)
{
  if (count != 0u && size > SIZE_MAX / count) {
    return NULL;
  }
  return cool_raw_malloc(count * size);
}

void cool_raw_free(void* ptr)
{
  CoolRawHeader* header;

  if (!ptr) {
    return;
  }

  header = cool_raw_find_header_from_payload(ptr);
  if (!header) {
    return;
  }
  if (header->prev) {
    header->prev->next = header->next;
  } else {
    g_cool_gc.raw_head = header->next;
  }
  if (header->next) {
    header->next->prev = header->prev;
  }
  cool_os_free(header, header->mapping_size);
}

char* cool_raw_strdup(const char* src)
{
  size_t len;
  char* dst;

  if (!src) {
    src = "";
  }

  len = strlen(src);
  dst = (char*)cool_raw_malloc(len + 1u);
  if (!dst) {
    return NULL;
  }
  memcpy(dst, src, len + 1u);
  return dst;
}

#ifndef COOL_GC_NO_MALLOC_WRAPPERS
void* malloc(size_t size)
{
  return cool_gc_malloc(size);
}

void* calloc(size_t count, size_t size)
{
  return cool_gc_calloc(count, size);
}

void free(void* ptr)
{
  CoolRawHeader* raw_header;

  if (!ptr) {
    return;
  }

  if (cool_gc_is_managed_pointer(ptr)) {
    cool_gc_free(ptr);
    return;
  }

  raw_header = cool_raw_find_header_from_payload(ptr);
  if (raw_header) {
    cool_raw_free(ptr);
  }
}
#endif
