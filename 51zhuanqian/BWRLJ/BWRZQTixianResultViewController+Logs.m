#import "BWRZQTixianResultViewController+Logs.h"
@implementation BWRZQTixianResultViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)goCustomBackActionLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)customBackPressLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
