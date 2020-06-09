#import "BWRZQHomeTaskOneView+LogsLogs.h"
@implementation BWRZQHomeTaskOneView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)showContentLogsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)clickPressLogsLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
