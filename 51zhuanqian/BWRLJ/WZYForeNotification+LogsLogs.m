#import "WZYForeNotification+LogsLogs.h"
@implementation WZYForeNotification (LogsLogs)
+ (BOOL)handleRemoteNotificationSoundidLogsLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)handleRemoteNotificationCustomsoundLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)showBannerWithUserInfoSoundidLogsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)appRootViewControllerLogsLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)deletWZYannerLogsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
