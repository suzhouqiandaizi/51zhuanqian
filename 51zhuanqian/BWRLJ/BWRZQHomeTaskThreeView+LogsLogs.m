#import "BWRZQHomeTaskThreeView+LogsLogs.h"
@implementation BWRZQHomeTaskThreeView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)showContentLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)clickPressLogsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
