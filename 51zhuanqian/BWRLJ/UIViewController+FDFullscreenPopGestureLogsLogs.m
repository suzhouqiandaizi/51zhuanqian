#import "UIViewController+FDFullscreenPopGestureLogsLogs.h"
@implementation UIViewController (FDFullscreenPopGestureLogsLogs)
+ (BOOL)fd_interactivePopDisabledLogsLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)setFd_interactivePopDisabledLogsLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)fd_prefersNavigationBarHiddenLogsLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)setFd_prefersNavigationBarHiddenLogsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)fd_interactivePopMaxAllowedInitialDistanceToLeftEdgeLogsLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)setFd_interactivePopMaxAllowedInitialDistanceToLeftEdgeLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
