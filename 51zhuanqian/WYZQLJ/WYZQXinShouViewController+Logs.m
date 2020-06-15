#import "WYZQXinShouViewController+Logs.h"
@implementation WYZQXinShouViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
