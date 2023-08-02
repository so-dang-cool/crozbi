const std = @import("std");

pub fn build(_: *std.build.Builder) void {
    std.log.info("No build to perform, czbi is a static bash script.", .{});
}
