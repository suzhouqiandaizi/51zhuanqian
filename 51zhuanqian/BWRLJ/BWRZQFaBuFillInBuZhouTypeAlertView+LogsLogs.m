#import "BWRZQFaBuFillInBuZhouTypeAlertView+LogsLogs.h"
@implementation BWRZQFaBuFillInBuZhouTypeAlertView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)tuwenPressLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)wangzhiPressLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)fuzhiPressLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
