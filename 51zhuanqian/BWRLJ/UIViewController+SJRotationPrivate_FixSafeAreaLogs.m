#import "UIViewController+SJRotationPrivate_FixSafeAreaLogs.h"
@implementation UIViewController (SJRotationPrivate_FixSafeAreaLogs)
+ (BOOL)sj_containsPlayerViewLogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
