const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Main engine module
    const engine_module = b.addModule("zengine", .{
        .root_source_file = .{ .cwd_relative = "src/root.zig" },
    });

    // Main executable (demo)
    const exe = b.addExecutable(.{
        .name = "zengine-demo",
        .root_source_file = .{ .cwd_relative = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe);

    // Run command
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "Run the demo");
    run_step.dependOn(&run_cmd.step);

    // Tests
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .cwd_relative = "src/tests.zig" },
        .target = target,
        .optimize = optimize,
    });
    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);

    // Benchmarks
    const bench_exe = b.addExecutable(.{
        .name = "benchmarks",
        .root_source_file = .{ .cwd_relative = "src/benchmark_runner.zig" },
        .target = target,
        .optimize = .ReleaseFast, // Always optimize benchmarks
    });
    const run_bench = b.addRunArtifact(bench_exe);
    const bench_step = b.step("bench", "Run benchmarks");
    bench_step.dependOn(&run_bench.step);

    // Terminal demo
    const term_demo = b.addExecutable(.{
        .name = "terminal-demo",
        .root_source_file = .{ .cwd_relative = "src/terminal_demo.zig" },
        .target = target,
        .optimize = optimize,
    });
    term_demo.root_module.addImport("zengine", engine_module);
    const run_term_demo = b.addRunArtifact(term_demo);
    const term_demo_step = b.step("demo", "Run terminal demo");
    term_demo_step.dependOn(&run_term_demo.step);
}
