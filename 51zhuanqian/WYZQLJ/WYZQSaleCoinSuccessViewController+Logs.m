#import "WYZQSaleCoinSuccessViewController+Logs.h"
@implementation WYZQSaleCoinSuccessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
