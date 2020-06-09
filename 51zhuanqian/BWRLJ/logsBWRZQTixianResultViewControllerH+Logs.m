#import "logsBWRZQTixianResultViewControllerH+Logs.h"
@implementation logsBWRZQTixianResultViewControllerH (Logs)
+ (BOOL)CviewDidLoadLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)xgoCustomBackActionLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)ScustomBackPressLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
