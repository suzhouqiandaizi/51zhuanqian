#import "WYZQFaBuSuccessViewController+Logs.h"
@implementation WYZQFaBuSuccessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)viewWillAppearLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)addCustomBackBtnLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)goCustomBackActionLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)customBackPressLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)showPressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
