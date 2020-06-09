#import "BWRZQHomeHeaderView+LogsLogs.h"
@implementation BWRZQHomeHeaderView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)morePressLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)twoBtnPressLogsLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setBannersLogsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)cycleScrollViewDidselectitematindexLogsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
