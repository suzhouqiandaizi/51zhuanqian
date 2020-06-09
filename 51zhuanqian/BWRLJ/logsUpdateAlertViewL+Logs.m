#import "logsUpdateAlertViewL+Logs.h"
@implementation logsUpdateAlertViewL (Logs)
+ (BOOL)rInititemLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)DremovePressLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)usurePressLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
