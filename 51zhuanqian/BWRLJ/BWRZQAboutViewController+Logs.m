#import "BWRZQAboutViewController+Logs.h"
@implementation BWRZQAboutViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)handleTapLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
