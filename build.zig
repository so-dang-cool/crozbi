const std = @import("std");

pub fn build(_: *std.build.Builder) void {
    std.log.info("No build to perform, crozbi is a static bash script.", .{});
}
