const std = @import("std");
const memory = @import("memory.zig");

pub fn EntityCollection(comptime config: anytype) type {
    return struct {
        const Self = @This();

        // TODO: Generate storage for each entity type
        // Note: inline for at struct level moved to comptime function

        pub fn init(allocator: std.mem.Allocator) !Self {
            _ = allocator; // Suppress unused parameter warning
            const self = Self{};

            // TODO: Initialize each entity type's storage
            // Note: Will implement when storage generation is complete
            _ = config; // Suppress unused parameter warning

            return self;
        }

        pub fn getAllSprites(self: *Self) []Sprite {
            _ = self; // Suppress unused parameter warning
            // TODO: Gather sprites from all entity types
            return &[_]Sprite{};
        }
    };
}

pub const Sprite = struct {
    // TODO: Define sprite data
};
