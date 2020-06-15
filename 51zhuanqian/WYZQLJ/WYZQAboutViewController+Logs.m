#import "WYZQAboutViewController+Logs.h"
@implementation WYZQAboutViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)handleTapLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
