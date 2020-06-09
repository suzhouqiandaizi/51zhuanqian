#import "MJRefreshBackStateFooter+Logs.h"
@implementation MJRefreshBackStateFooter (Logs)
+ (BOOL)stateTitlesLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)stateLabelLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setTitleForstateLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)titleForStateLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
