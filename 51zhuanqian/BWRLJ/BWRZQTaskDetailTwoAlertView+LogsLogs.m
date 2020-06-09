#import "BWRZQTaskDetailTwoAlertView+LogsLogs.h"
@implementation BWRZQTaskDetailTwoAlertView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)neverShowPressLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
