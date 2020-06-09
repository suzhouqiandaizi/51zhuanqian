#import "BWRZQHomeTaskOneView+Logs.h"
@implementation BWRZQHomeTaskOneView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
