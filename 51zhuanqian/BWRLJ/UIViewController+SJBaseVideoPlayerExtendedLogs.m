#import "UIViewController+SJBaseVideoPlayerExtendedLogs.h"
@implementation UIViewController (SJBaseVideoPlayerExtendedLogs)
+ (BOOL)setTransitionDurationPresentedanimationDismissedanimationLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
