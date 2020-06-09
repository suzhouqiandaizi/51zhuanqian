#import "MJRefreshStateHeader+Logs.h"
@implementation MJRefreshStateHeader (Logs)
+ (BOOL)stateTitlesLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)stateLabelLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)lastUpdatedTimeLabelLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)setTitleForstateLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)setLastUpdatedTimeKeyLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
