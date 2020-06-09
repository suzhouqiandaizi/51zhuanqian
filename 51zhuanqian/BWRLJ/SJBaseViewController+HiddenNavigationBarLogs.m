#import "SJBaseViewController+HiddenNavigationBarLogs.h"
@implementation SJBaseViewController (HiddenNavigationBarLogs)
+ (BOOL)setNeedHiddenNavigationBarLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)needHiddenNavigationBarLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
