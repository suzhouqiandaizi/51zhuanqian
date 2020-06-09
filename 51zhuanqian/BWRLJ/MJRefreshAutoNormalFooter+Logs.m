#import "MJRefreshAutoNormalFooter+Logs.h"
@implementation MJRefreshAutoNormalFooter (Logs)
+ (BOOL)loadingViewLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)setActivityIndicatorViewStyleLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
