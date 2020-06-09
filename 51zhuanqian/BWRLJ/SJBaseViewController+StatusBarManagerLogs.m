#import "SJBaseViewController+StatusBarManagerLogs.h"
@implementation SJBaseViewController (StatusBarManagerLogs)
+ (BOOL)statusBarManagerLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
