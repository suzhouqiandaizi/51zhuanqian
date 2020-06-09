#import "MJRefreshNormalHeader+Logs.h"
@implementation MJRefreshNormalHeader (Logs)
+ (BOOL)arrowViewLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)loadingViewLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)setActivityIndicatorViewStyleLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
