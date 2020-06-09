#import "MJRefreshBackFooter+Logs.h"
@implementation MJRefreshBackFooter (Logs)
+ (BOOL)willMoveToSuperviewLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)scrollViewContentSizeDidChangeLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)heightForContentBreakViewLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)happenOffsetYLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
