#import "UIViewController+FDFullscreenPopGestureLogs.h"
@implementation UIViewController (FDFullscreenPopGestureLogs)
+ (BOOL)fd_interactivePopDisabledLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)setFd_interactivePopDisabledLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)fd_prefersNavigationBarHiddenLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)setFd_prefersNavigationBarHiddenLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)fd_interactivePopMaxAllowedInitialDistanceToLeftEdgeLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)setFd_interactivePopMaxAllowedInitialDistanceToLeftEdgeLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
