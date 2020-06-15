#import "WYZQHomeTaskThreeView+Logs.h"
@implementation WYZQHomeTaskThreeView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
