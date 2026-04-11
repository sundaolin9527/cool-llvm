#ifndef COOL_GC_H
#define COOL_GC_H

#include <stddef.h>
#include <stdint.h>

#if defined(_WIN32)
  #define COOL_GC_EXPORT __declspec(dllexport)
#else
  #define COOL_GC_EXPORT __attribute__((visibility("default")))
#endif

#ifdef __cplusplus
extern "C" {
#endif

typedef enum CoolGCState {
  COOL_GC_PAUSE = 0,
  COOL_GC_PROPAGATE = 1,
  COOL_GC_ATOMIC = 2,
  COOL_GC_SWEEP = 3
} CoolGCState;

typedef struct CoolGCStats {
  size_t total_managed_bytes;
  size_t live_managed_bytes;
  size_t allocation_count;
  size_t collection_count;
  size_t reclaimed_objects;
  size_t reclaimed_bytes;
  uint32_t current_white;
  int state;
} CoolGCStats;

COOL_GC_EXPORT void cool_gc_runtime_init(void);
COOL_GC_EXPORT void cool_gc_runtime_shutdown(void);
COOL_GC_EXPORT void cool_gc_force_full(void);
COOL_GC_EXPORT int cool_gc_step(void);
COOL_GC_EXPORT void cool_gc_set_stack_roots_enabled(int enabled);

COOL_GC_EXPORT void* cool_gc_malloc(size_t size);
COOL_GC_EXPORT void* cool_gc_calloc(size_t count, size_t size);
COOL_GC_EXPORT void cool_gc_free(void* ptr);
COOL_GC_EXPORT int cool_gc_is_managed_pointer(const void* ptr);
COOL_GC_EXPORT int cool_gc_contains_pointer(const void* ptr);

COOL_GC_EXPORT void cool_gc_register_root(void** slot);
COOL_GC_EXPORT void cool_gc_unregister_root(void** slot);

COOL_GC_EXPORT void cool_gc_get_stats(CoolGCStats* out_stats);

COOL_GC_EXPORT void* cool_raw_malloc(size_t size);
COOL_GC_EXPORT void* cool_raw_calloc(size_t count, size_t size);
COOL_GC_EXPORT void cool_raw_free(void* ptr);
COOL_GC_EXPORT char* cool_raw_strdup(const char* src);

/*
 * Generated LLVM IR still calls the C allocator symbols directly.
 * libruntime.so exports wrappers so COOL objects can transparently use GC.
 */
#ifndef COOL_GC_NO_MALLOC_WRAPPERS
COOL_GC_EXPORT void* malloc(size_t size);
COOL_GC_EXPORT void* calloc(size_t count, size_t size);
COOL_GC_EXPORT void free(void* ptr);
#endif

#ifdef __cplusplus
}
#endif

#endif
