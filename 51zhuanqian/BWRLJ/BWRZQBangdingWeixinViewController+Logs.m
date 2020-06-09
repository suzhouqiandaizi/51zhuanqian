#import "BWRZQBangdingWeixinViewController+Logs.h"
@implementation BWRZQBangdingWeixinViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
