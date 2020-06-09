#import "MJRefreshFooter+Logs.h"
@implementation MJRefreshFooter (Logs)
+ (BOOL)footerWithRefreshingBlockLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)footerWithRefreshingTargetRefreshingactionLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)endRefreshingWithNoMoreDataLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)noticeNoMoreDataLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)resetNoMoreDataLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setAutomaticallyHiddenLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
