#import "BWRZQSubmitAlertView+Logs.h"
@implementation BWRZQSubmitAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)neverShowPressLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
