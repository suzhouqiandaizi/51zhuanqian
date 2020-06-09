#import "BWRZQTixianResultViewController+LogsLogs.h"
@implementation BWRZQTixianResultViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)goCustomBackActionLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)customBackPressLogsLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
