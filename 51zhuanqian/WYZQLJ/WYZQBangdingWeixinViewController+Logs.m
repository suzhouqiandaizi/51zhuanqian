#import "WYZQBangdingWeixinViewController+Logs.h"
@implementation WYZQBangdingWeixinViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
