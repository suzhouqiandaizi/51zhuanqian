#import "WYZQTaskDetailTwoAlertView+Logs.h"
@implementation WYZQTaskDetailTwoAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)neverShowPressLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
