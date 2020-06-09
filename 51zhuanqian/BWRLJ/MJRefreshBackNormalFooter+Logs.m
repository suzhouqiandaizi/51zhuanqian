#import "MJRefreshBackNormalFooter+Logs.h"
@implementation MJRefreshBackNormalFooter (Logs)
+ (BOOL)arrowViewLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)loadingViewLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setActivityIndicatorViewStyleLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
