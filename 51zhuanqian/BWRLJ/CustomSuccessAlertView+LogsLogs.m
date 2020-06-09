#import "CustomSuccessAlertView+LogsLogs.h"
@implementation CustomSuccessAlertView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
