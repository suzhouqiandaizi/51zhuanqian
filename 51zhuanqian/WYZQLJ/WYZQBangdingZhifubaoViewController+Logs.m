#import "WYZQBangdingZhifubaoViewController+Logs.h"
@implementation WYZQBangdingZhifubaoViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
