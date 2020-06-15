#import "WYZQFaBuFillInBuZhouTypeAlertView+Logs.h"
@implementation WYZQFaBuFillInBuZhouTypeAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)tuwenPressLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)wangzhiPressLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)fuzhiPressLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
