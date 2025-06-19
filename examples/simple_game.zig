const zengine = @import("zengine");

pub const SimpleGame = struct {
    entities: zengine.EntityCollection(.{
        .Player = .{ .max_count = 1 },
        .Enemy = .{ .max_count = 10 },
    }),

    pub fn update(self: *SimpleGame, input: zengine.Input) !void {
        _ = self;
        _ = input;
        // Just a stub for now
    }

    pub fn render(self: *SimpleGame) !void {
        _ = self;
        // Just a stub for now
    }
};

pub fn main() !void {
    const GameEngine = zengine.createGame(SimpleGame);
    var game = try GameEngine.init();
    try game.run();
}
