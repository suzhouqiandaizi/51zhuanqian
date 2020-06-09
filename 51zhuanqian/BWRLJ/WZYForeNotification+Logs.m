#import "WZYForeNotification+Logs.h"
@implementation WZYForeNotification (Logs)
+ (BOOL)handleRemoteNotificationSoundidLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)handleRemoteNotificationCustomsoundLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)showBannerWithUserInfoSoundidLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)appRootViewControllerLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)deletWZYannerLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
