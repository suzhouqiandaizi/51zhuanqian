#import "SJBaseViewController+OnceLogs.h"
@implementation SJBaseViewController (OnceLogs)
+ (BOOL)once_viewDidAppear_methodLogs:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
