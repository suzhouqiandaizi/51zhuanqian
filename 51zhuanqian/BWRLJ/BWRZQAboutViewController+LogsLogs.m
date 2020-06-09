#import "BWRZQAboutViewController+LogsLogs.h"
@implementation BWRZQAboutViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)handleTapLogsLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)showContentLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
