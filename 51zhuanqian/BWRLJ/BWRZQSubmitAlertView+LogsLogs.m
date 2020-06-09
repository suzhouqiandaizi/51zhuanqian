#import "BWRZQSubmitAlertView+LogsLogs.h"
@implementation BWRZQSubmitAlertView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)neverShowPressLogsLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
