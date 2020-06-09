#import "RefreshErrorAlertView+Logs.h"
@implementation RefreshErrorAlertView (Logs)
+ (BOOL)initItemWithtypeWithtipLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)initItemWithtypeWithtipRefreshLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)refreshPressLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
