#import "WYZQSettingViewController+Logs.h"
@implementation WYZQSettingViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)logoutPressLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)cleanPressLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)feedbackPressLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)aboutPressLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)questionsPressLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)heimingdanPressLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)updatePressLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)haopingPressLogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
