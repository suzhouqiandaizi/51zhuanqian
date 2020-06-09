#import "BWRZQBangdingWeixinViewController+LogsLogs.h"
@implementation BWRZQBangdingWeixinViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
