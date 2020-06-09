#import "BWRZQBangdingZhifubaoViewController+LogsLogs.h"
@implementation BWRZQBangdingZhifubaoViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
