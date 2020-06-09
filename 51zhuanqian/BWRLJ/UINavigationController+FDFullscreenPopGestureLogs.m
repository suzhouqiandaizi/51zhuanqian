#import "UINavigationController+FDFullscreenPopGestureLogs.h"
@implementation UINavigationController (FDFullscreenPopGestureLogs)
+ (BOOL)loadLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)fd_pushViewControllerAnimatedLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)fd_setupViewControllerBasedNavigationBarAppearanceIfNeededLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)fd_popGestureRecognizerDelegateLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)fd_fullscreenPopGestureRecognizerLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)fd_viewControllerBasedNavigationBarAppearanceEnabledLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)setFd_viewControllerBasedNavigationBarAppearanceEnabledLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
