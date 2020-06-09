#import "logsBWRZQLoginAlertVieww+Logs.h"
@implementation logsBWRZQLoginAlertVieww (Logs)
+ (BOOL)VinitItemLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)hremovePressLogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
