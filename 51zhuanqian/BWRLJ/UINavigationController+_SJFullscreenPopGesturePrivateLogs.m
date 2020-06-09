#import "UINavigationController+_SJFullscreenPopGesturePrivateLogs.h"
@implementation UINavigationController (_SJFullscreenPopGesturePrivateLogs)
+ (BOOL)loadLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)sj_pushViewControllerAnimatedLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)sj_setupIfNeededLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)sj_fullscreenGestureLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)sj_handleFullscreenGestureLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
