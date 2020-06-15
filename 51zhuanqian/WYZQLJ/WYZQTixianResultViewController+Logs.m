#import "WYZQTixianResultViewController+Logs.h"
@implementation WYZQTixianResultViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)goCustomBackActionLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)customBackPressLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
