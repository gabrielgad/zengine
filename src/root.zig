const std = @import("std");

// Core modules
pub const hardware = @import("hardware.zig");
pub const memory = @import("memory.zig");
pub const entity = @import("entity.zig");
pub const jobs = @import("jobs.zig");

// Re-export commonly used types
pub const EntityCollection = entity.EntityCollection;
pub const HardwareInfo = hardware.HardwareInfo;
pub const Input = struct {
    // TODO: Input implementation
};

// Main engine structure
pub const Engine = struct {
    running: bool,
    hardware_info: hardware.HardwareInfo,

    pub fn init() Engine {
        const hw_info = hardware.detectHardware();
        log("Detected hardware: {} cores, {} MB RAM", .{
            hw_info.cpu_cores,
            hw_info.ram_size / (1024 * 1024),
        });

        return Engine{
            .running = true,
            .hardware_info = hw_info,
        };
    }

    pub fn isRunning(self: *Engine) bool {
        return self.running;
    }

    pub fn handleInput(self: *Engine) void {
        _ = self;
        // TODO: Input handling implementation
    }

    pub fn update(self: *Engine) void {
        _ = self;
        // TODO: Game logic update implementation
    }

    pub fn render(self: *Engine) void {
        _ = self;
        // TODO: Rendering implementation
    }

    pub fn stop(self: *Engine) void {
        self.running = false;
    }
};

pub fn log(comptime fmt: []const u8, args: anytype) void {
    std.debug.print("[ZEngine] " ++ fmt ++ "\n", args);
}

// For the compile-time game creation
pub fn createGame(comptime GameType: type) type {
    // TODO: Generate optimized engine for this game type
    return struct {
        pub fn init() !GameType {
            return GameType{};
        }
    };
}
