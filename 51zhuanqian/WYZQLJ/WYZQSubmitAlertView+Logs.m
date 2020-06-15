#import "WYZQSubmitAlertView+Logs.h"
@implementation WYZQSubmitAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)neverShowPressLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
