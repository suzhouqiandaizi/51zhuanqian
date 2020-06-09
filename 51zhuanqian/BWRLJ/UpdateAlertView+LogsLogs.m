#import "UpdateAlertView+LogsLogs.h"
@implementation UpdateAlertView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
