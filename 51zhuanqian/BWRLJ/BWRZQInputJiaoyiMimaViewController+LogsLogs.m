#import "BWRZQInputJiaoyiMimaViewController+LogsLogs.h"
@implementation BWRZQInputJiaoyiMimaViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)cancelTapLogsLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)wangjimimaPressLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
