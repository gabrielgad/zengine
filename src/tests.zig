const std = @import("std");
const testing = std.testing;
const zengine = @import("root.zig");

test "hardware detection" {
    const hw_info = zengine.hardware.detectHardware();
    try testing.expect(hw_info.cpu_cores > 0);
    try testing.expect(hw_info.ram_size > 0);
}

test "memory alignment" {
    // Test that our memory allocations are cache-aligned
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const cache_allocator = zengine.memory.CacheAlignedAllocator{
        .backing_allocator = allocator,
        .cache_line_size = 64,
    };
    _ = cache_allocator; // Suppress unused variable warning

    // TODO: Test allocation alignment
}

test "entity collection compilation" {
    // This tests that our compile-time entity system works
    const TestGame = struct {
        entities: zengine.EntityCollection(.{
            .Player = .{ .max_count = 1 },
            .Enemy = .{ .max_count = 100 },
        }),
    };

    // If this compiles, the basic structure works
    _ = TestGame;
}

test "basic engine lifecycle" {
    var engine = zengine.Engine.init();
    try testing.expect(engine.isRunning());

    engine.stop();
    try testing.expect(!engine.isRunning());
}
