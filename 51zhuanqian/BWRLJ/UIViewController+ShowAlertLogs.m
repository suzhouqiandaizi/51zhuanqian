#import "UIViewController+ShowAlertLogs.h"
@implementation UIViewController (ShowAlertLogs)
+ (BOOL)HUDLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setHUDLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)showHUDAlertLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)loadingHUDAlertLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)loadingHUDAlertWithviewLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)hideHudAlertLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)loadingHUDAlertToWindowLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
