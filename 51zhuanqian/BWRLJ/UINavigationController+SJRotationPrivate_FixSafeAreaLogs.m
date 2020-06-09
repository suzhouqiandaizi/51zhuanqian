#import "UINavigationController+SJRotationPrivate_FixSafeAreaLogs.h"
@implementation UINavigationController (SJRotationPrivate_FixSafeAreaLogs)
+ (BOOL)sj_containsPlayerViewLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
