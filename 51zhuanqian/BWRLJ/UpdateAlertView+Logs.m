#import "UpdateAlertView+Logs.h"
@implementation UpdateAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
