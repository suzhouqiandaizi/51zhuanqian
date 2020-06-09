#import "BWRZQHomeTaskTwoView+Logs.h"
@implementation BWRZQHomeTaskTwoView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
