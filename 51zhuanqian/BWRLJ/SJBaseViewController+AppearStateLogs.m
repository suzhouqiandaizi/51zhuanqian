#import "SJBaseViewController+AppearStateLogs.h"
@implementation SJBaseViewController (AppearStateLogs)
+ (BOOL)getAppearStateObserverLogs:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
