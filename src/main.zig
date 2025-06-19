const std = @import("std");
const engine = @import("root.zig");

pub fn main() !void {
    engine.log("Game Started", .{});

    var game_engine = engine.Engine.init();

    // Basic game loop
    while (game_engine.isRunning()) {
        game_engine.handleInput();
        game_engine.update();
        game_engine.render();

        // For now, just exit after one iteration
        game_engine.stop();
    }

    engine.log("Game Stopped", .{});
}
