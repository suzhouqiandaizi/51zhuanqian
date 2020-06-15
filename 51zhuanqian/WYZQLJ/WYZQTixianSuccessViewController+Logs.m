#import "WYZQTixianSuccessViewController+Logs.h"
@implementation WYZQTixianSuccessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)viewWillAppearLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)addCustomBackBtnLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)goCustomBackActionLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
