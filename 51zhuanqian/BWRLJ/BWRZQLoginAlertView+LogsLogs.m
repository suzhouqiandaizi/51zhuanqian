#import "BWRZQLoginAlertView+LogsLogs.h"
@implementation BWRZQLoginAlertView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
