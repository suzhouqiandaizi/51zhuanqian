#import "WYZQHomeTaskOneView+Logs.h"
@implementation WYZQHomeTaskOneView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
