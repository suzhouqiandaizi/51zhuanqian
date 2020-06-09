#import "UIViewController+_SJFullscreenPopGesturePrivateLogs.h"
@implementation UIViewController (_SJFullscreenPopGesturePrivateLogs)
+ (BOOL)setSj_previousViewControllerSnapshotLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)sj_previousViewControllerSnapshotLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
