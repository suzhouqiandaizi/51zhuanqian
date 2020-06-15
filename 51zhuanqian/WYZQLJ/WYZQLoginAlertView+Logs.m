#import "WYZQLoginAlertView+Logs.h"
@implementation WYZQLoginAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
