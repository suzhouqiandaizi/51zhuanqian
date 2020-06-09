#import "BWRZQTaskButton+LogsLogs.h"
@implementation BWRZQTaskButton (LogsLogs)
+ (BOOL)drawRectLogsLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)setTaskButtonLogsLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setTaskButtonTitleWithstatusLogsLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)setTaskDoingButtonTitleWithstatusLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
