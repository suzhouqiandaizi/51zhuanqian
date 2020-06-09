#import "logsBWRZQBangdingWeixinViewControllerK+Logs.h"
@implementation logsBWRZQBangdingWeixinViewControllerK (Logs)
+ (BOOL)LviewDidLoadLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)csurePressLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
