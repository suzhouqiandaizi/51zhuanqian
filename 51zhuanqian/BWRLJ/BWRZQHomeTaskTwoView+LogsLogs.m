#import "BWRZQHomeTaskTwoView+LogsLogs.h"
@implementation BWRZQHomeTaskTwoView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)showContentLogsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)clickPressLogsLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
