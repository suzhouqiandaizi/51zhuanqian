#import "BWRZQLoginAlertView+Logs.h"
@implementation BWRZQLoginAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
