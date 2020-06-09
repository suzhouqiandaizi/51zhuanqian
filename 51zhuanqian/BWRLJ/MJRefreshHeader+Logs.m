#import "MJRefreshHeader+Logs.h"
@implementation MJRefreshHeader (Logs)
+ (BOOL)headerWithRefreshingBlockLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)headerWithRefreshingTargetRefreshingactionLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)resetInsetLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)lastUpdatedTimeLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)setIgnoredScrollViewContentInsetTopLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
