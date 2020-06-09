#import "UIViewController+FDFullscreenPopGesturePrivateLogs.h"
@implementation UIViewController (FDFullscreenPopGesturePrivateLogs)
+ (BOOL)loadLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)fd_viewWillAppearLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)fd_viewWillDisappearLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)fd_willAppearInjectBlockLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)setFd_willAppearInjectBlockLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
