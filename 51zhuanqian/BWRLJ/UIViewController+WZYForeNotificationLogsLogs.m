#import "UIViewController+WZYForeNotificationLogsLogs.h"
@implementation UIViewController (WZYForeNotificationLogsLogs)
+ (BOOL)setWZYForegroundNotificationStatusBarHiddenLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)WZYForegroundNotificationStatusBarHiddenLogsLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)prefersStatusBarHiddenLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
