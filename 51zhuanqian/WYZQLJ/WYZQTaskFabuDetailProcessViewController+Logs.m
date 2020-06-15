#import "WYZQTaskFabuDetailProcessViewController+Logs.h"
@implementation WYZQTaskFabuDetailProcessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
