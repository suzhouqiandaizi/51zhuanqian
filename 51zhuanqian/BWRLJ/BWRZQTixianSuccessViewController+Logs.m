#import "BWRZQTixianSuccessViewController+Logs.h"
@implementation BWRZQTixianSuccessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)viewWillAppearLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)addCustomBackBtnLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)goCustomBackActionLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
