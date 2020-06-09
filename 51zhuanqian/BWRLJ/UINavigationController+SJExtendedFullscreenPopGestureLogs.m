#import "UINavigationController+SJExtendedFullscreenPopGestureLogs.h"
@implementation UINavigationController (SJExtendedFullscreenPopGestureLogs)
+ (BOOL)sj_fullscreenGestureStateLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
