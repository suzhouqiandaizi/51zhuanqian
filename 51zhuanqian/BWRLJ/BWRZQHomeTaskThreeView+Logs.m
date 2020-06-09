#import "BWRZQHomeTaskThreeView+Logs.h"
@implementation BWRZQHomeTaskThreeView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
