#import "BWRZQFaBuFillInBuZhouTypeAlertView+Logs.h"
@implementation BWRZQFaBuFillInBuZhouTypeAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)tuwenPressLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)wangzhiPressLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)fuzhiPressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
