const std = @import("std");

// Export our engine components
pub const Engine = struct {
    running: bool,
    
    pub fn init() Engine {
        return Engine{
            .running = true,
        };
    }
    
    pub fn isRunning(self: *const Engine) bool {
        return self.running;
    }
    
    pub fn stop(self: *Engine) void {
        self.running = false;
    }
   
    pub fn handleInput(self: *Engine) void {
        // TODO: Handle input
        _ = self;
    }
    
    pub fn update(self: *Engine) void {
        // TODO: Update game state
        _ = self;
    }
    
    pub fn render(self: *Engine) void {
        // TODO: Render
        _ = self;
    }
};

// You could also export utility functions
pub fn log(message: []const u8) void {
    std.debug.print("[Engine] {s}\n", .{message});
}
