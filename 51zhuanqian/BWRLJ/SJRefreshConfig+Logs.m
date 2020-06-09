#import "SJRefreshConfig+Logs.h"
@implementation SJRefreshConfig (Logs)
+ (BOOL)initWithScrollViewLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)configHeaderLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)configFooterLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)setIgnoredTopEdgeInsetLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)ignoredTopEdgeInsetLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
