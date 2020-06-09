#import "BWRZQTaskFabuDetailProcessViewController+Logs.h"
@implementation BWRZQTaskFabuDetailProcessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
