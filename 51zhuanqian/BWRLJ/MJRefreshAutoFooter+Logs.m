#import "MJRefreshAutoFooter+Logs.h"
@implementation MJRefreshAutoFooter (Logs)
+ (BOOL)willMoveToSuperviewLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)setAppearencePercentTriggerAutoRefreshLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)appearencePercentTriggerAutoRefreshLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)scrollViewContentSizeDidChangeLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)scrollViewPanStateDidChangeLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)ignoreRefreshActionLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)beginRefreshingLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setHiddenLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
