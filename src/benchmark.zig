const std = @import("std");
const time = std.time;

pub fn benchmark(name: []const u8, iterations: u32, func: anytype) !void {
    const start = time.nanoTimestamp();

    var i: u32 = 0;
    while (i < iterations) : (i += 1) {
        try func();
    }

    const end = time.nanoTimestamp();
    const elapsed_ns: u64 = @intCast(end - start);
    const ns_per_op = elapsed_ns / iterations;

    std.debug.print("{s}: {} ns/op ({} ops/sec)\n", .{ name, ns_per_op, 1_000_000_000 / ns_per_op });
}
