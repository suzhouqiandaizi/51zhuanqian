#import "BWRZQTaskDetailTwoAlertView+Logs.h"
@implementation BWRZQTaskDetailTwoAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)neverShowPressLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
