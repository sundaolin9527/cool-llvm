#include <stdio.h>
#include <stdlib.h>

#include "../../lib/gc/gc.h"

typedef struct TestNode {
  struct TestNode* next;
  struct TestNode* alt;
  int value;
} TestNode;

static int g_failures = 0;

#define CHECK(condition, message) \
  do { \
    if (!(condition)) { \
      fprintf(stderr, "[FAIL] %s:%d: %s\n", __FILE__, __LINE__, (message)); \
      g_failures += 1; \
    } \
  } while (0)

static TestNode* alloc_node(int value)
{
  TestNode* node = (TestNode*)cool_gc_malloc(sizeof(TestNode));
  CHECK(node != NULL, "allocation should succeed");
  if (!node) {
    return NULL;
  }
  node->next = NULL;
  node->alt = NULL;
  node->value = value;
  return node;
}

static void build_unreachable_cycle(void)
{
  TestNode* a = alloc_node(1);
  TestNode* b = alloc_node(2);
  if (!a || !b) {
    return;
  }
  a->next = b;
  b->next = a;
}

static void test_registered_root_survives(void)
{
  TestNode* root = alloc_node(10);
  TestNode* child = alloc_node(20);
  CoolGCStats stats;

  CHECK(root != NULL, "root object should exist");
  CHECK(child != NULL, "child object should exist");
  if (!root || !child) {
    return;
  }

  root->next = child;
  cool_gc_register_root((void**)&root);
  cool_gc_force_full();

  CHECK(cool_gc_is_managed_pointer(root), "registered root should survive full GC");
  CHECK(cool_gc_is_managed_pointer(child), "reachable child should survive full GC");

  cool_gc_unregister_root((void**)&root);
  root = NULL;
  child = NULL;
  cool_gc_force_full();
  cool_gc_get_stats(&stats);
  CHECK(stats.total_managed_bytes == 0u, "all objects should be reclaimed after dropping the root");
}

static void test_unreachable_cycle_is_collected(void)
{
  CoolGCStats before;
  CoolGCStats after;

  cool_gc_get_stats(&before);
  build_unreachable_cycle();
  cool_gc_force_full();
  cool_gc_get_stats(&after);

  CHECK(after.total_managed_bytes == before.total_managed_bytes, "unreachable cycle should be reclaimed");
  CHECK(after.reclaimed_objects >= before.reclaimed_objects + 2u, "cycle collection should reclaim both nodes");
}

static void test_incremental_steps_progress(void)
{
  TestNode* root = alloc_node(30);
  TestNode* cursor = root;
  CoolGCStats before;
  CoolGCStats after;
  int steps = 0;
  int guard = 0;

  CHECK(root != NULL, "incremental root should exist");
  if (!root) {
    return;
  }

  cool_gc_register_root((void**)&root);
  for (int index = 0; index < 64; ++index) {
    cursor->next = alloc_node(100 + index);
    CHECK(cursor->next != NULL, "list node allocation should succeed");
    if (!cursor->next) {
      break;
    }
    cursor = cursor->next;
  }
  cool_gc_unregister_root((void**)&root);
  root = NULL;
  cursor = NULL;

  cool_gc_get_stats(&before);
  do {
    steps += 1;
    cool_gc_step();
    cool_gc_get_stats(&after);
    guard += 1;
  } while (after.state != COOL_GC_PAUSE && guard < 512);

  CHECK(guard < 512, "incremental GC should finish within a bounded number of steps");
  CHECK(steps > 0, "incremental GC should execute at least one step");
  CHECK(after.collection_count >= before.collection_count + 1u, "incremental GC should complete a collection cycle");
  CHECK(after.reclaimed_objects > before.reclaimed_objects, "incremental GC should reclaim unreachable nodes");
  CHECK(after.total_managed_bytes == 0u, "incremental GC should reclaim the temporary list");
}

static void test_black_to_white_repair(void)
{
  TestNode* root = alloc_node(40);
  TestNode* old_child = alloc_node(41);
  TestNode* new_child;

  CHECK(root != NULL, "repair root should exist");
  CHECK(old_child != NULL, "repair child should exist");
  if (!root || !old_child) {
    return;
  }

  root->next = old_child;
  cool_gc_register_root((void**)&root);

  cool_gc_step();
  cool_gc_step();

  new_child = alloc_node(42);
  CHECK(new_child != NULL, "replacement child should exist");
  if (!new_child) {
    cool_gc_unregister_root((void**)&root);
    return;
  }

  root->next = new_child;
  old_child = NULL;

  cool_gc_force_full();

  CHECK(cool_gc_is_managed_pointer(root), "root should survive repaired incremental cycle");
  CHECK(cool_gc_is_managed_pointer(new_child), "new child stored into a black object should survive");

  cool_gc_unregister_root((void**)&root);
  root = NULL;
  new_child = NULL;
  cool_gc_force_full();
}

int main(void)
{
  cool_gc_runtime_init();
  cool_gc_set_stack_roots_enabled(0);

  test_registered_root_survives();
  test_unreachable_cycle_is_collected();
  test_incremental_steps_progress();
  test_black_to_white_repair();

  cool_gc_runtime_shutdown();

  if (g_failures != 0) {
    fprintf(stderr, "gc_runtime_test: %d failure(s)\n", g_failures);
    return 1;
  }

  printf("gc_runtime_test: all checks passed\n");
  return 0;
}
