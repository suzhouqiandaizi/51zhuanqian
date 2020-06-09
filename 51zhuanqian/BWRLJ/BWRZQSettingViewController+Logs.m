#import "BWRZQSettingViewController+Logs.h"
@implementation BWRZQSettingViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)logoutPressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)cleanPressLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)feedbackPressLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)aboutPressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)questionsPressLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)heimingdanPressLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)updatePressLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)haopingPressLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
