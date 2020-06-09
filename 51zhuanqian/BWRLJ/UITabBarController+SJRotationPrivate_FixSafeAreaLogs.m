#import "UITabBarController+SJRotationPrivate_FixSafeAreaLogs.h"
@implementation UITabBarController (SJRotationPrivate_FixSafeAreaLogs)
+ (BOOL)sj_containsPlayerViewLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
