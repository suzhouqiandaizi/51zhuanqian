#import "logsBWRZQFaBuFillInBuZhouTypeAlertViewf+Logs.h"
@implementation logsBWRZQFaBuFillInBuZhouTypeAlertViewf (Logs)
+ (BOOL)jinitItemLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)jremovePressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)stuwenPressLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)qwangzhiPressLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)rfuzhiPressLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
