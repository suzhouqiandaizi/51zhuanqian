#import "BWRZQTixianSuccessViewController+LogsLogs.h"
@implementation BWRZQTixianSuccessViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)viewWillAppearLogsLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)viewWillDisappearLogsLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)addCustomBackBtnLogsLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)goCustomBackActionLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
