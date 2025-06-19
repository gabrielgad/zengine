const std = @import("std");
const zengine = @import("root.zig");

pub fn main() !void {
    std.debug.print("\n=== ZEngine Benchmarks ===\n\n", .{});

    // Memory allocation benchmark
    try benchmarkMemoryAllocation();

    // Entity iteration benchmark
    try benchmarkEntityIteration();
}

fn benchmarkMemoryAllocation() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const iterations = 10000;
    const start = std.time.nanoTimestamp();

    var i: u32 = 0;
    while (i < iterations) : (i += 1) {
        const mem = try allocator.alloc(u8, 1024);
        defer allocator.free(mem);
        // Simulate some work
        mem[0] = @intCast(i % 256);
    }

    const end = std.time.nanoTimestamp();
    const elapsed_ms = @divFloor(@as(u64, @intCast(end - start)), 1_000_000);

    std.debug.print("Memory allocation: {} iterations in {} ms\n", .{ iterations, elapsed_ms });
}

fn benchmarkEntityIteration() !void {
    // TODO: Implement entity iteration benchmark
    std.debug.print("Entity iteration: TODO\n", .{});
}
