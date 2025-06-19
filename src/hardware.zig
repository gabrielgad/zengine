const std = @import("std");
const builtin = @import("builtin");

pub const HardwareTier = enum {
    potato,
    mid_range,
    high_end,
    enthusiast,
};

pub const HardwareInfo = struct {
    cpu_cores: u32,
    cpu_threads: u32,
    cache_line_size: u32,
    l1_cache_size: u32,
    l2_cache_size: u32,
    l3_cache_size: u32,
    ram_size: u64,
    gpu_memory: u64,
    tier: HardwareTier,
};

pub fn detectHardware() HardwareInfo {
    // Mock implementation for now
    return HardwareInfo{
        .cpu_cores = 8,
        .cpu_threads = 16,
        .cache_line_size = 64,
        .l1_cache_size = 32 * 1024,
        .l2_cache_size = 256 * 1024,
        .l3_cache_size = 8 * 1024 * 1024,
        .ram_size = 16 * 1024 * 1024 * 1024, // 16 GB
        .gpu_memory = 8 * 1024 * 1024 * 1024, // 8 GB
        .tier = .high_end,
    };
}
