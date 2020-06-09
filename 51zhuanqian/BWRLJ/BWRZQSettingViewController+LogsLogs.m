#import "BWRZQSettingViewController+LogsLogs.h"
@implementation BWRZQSettingViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)logoutPressLogsLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)cleanPressLogsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)feedbackPressLogsLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)aboutPressLogsLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)questionsPressLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)heimingdanPressLogsLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)updatePressLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)haopingPressLogsLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
