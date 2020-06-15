#import "WYZQHomeTaskTwoView+Logs.h"
@implementation WYZQHomeTaskTwoView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
