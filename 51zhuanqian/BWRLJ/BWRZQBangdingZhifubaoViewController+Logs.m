#import "BWRZQBangdingZhifubaoViewController+Logs.h"
@implementation BWRZQBangdingZhifubaoViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
