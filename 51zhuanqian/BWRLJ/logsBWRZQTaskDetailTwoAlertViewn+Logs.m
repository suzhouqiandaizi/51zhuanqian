#import "logsBWRZQTaskDetailTwoAlertViewn+Logs.h"
@implementation logsBWRZQTaskDetailTwoAlertViewn (Logs)
+ (BOOL)yinitItemLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)gremovePressLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)bsurePressLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)IneverShowPressLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
