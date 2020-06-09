#import "UIViewController+WZYForeNotificationLogs.h"
@implementation UIViewController (WZYForeNotificationLogs)
+ (BOOL)setWZYForegroundNotificationStatusBarHiddenLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)WZYForegroundNotificationStatusBarHiddenLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)prefersStatusBarHiddenLogs:(NSInteger)logs {
    return logs % 19 == 0;
}

@end
