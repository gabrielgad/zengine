const std = @import("std");
const hardware = @import("hardware.zig");

pub const ResourceEnvelope = struct {
    max_memory: u64,
    max_entities: u32,
    max_draw_calls: u32,
    max_audio_voices: u32,
    thread_count: u32,
};

pub fn analyzeGameRequirements(comptime GameType: type) ResourceEnvelope {
    _ = GameType; // Suppress unused parameter warning
    // Analyze the game struct at compile time
    comptime {
        const envelope = ResourceEnvelope{
            .max_memory = 0,
            .max_entities = 0,
            .max_draw_calls = 0,
            .max_audio_voices = 0,
            .thread_count = 1,
        };

        // TODO: Analyze GameType fields and methods
        // to determine resource requirements

        return envelope;
    }
}
