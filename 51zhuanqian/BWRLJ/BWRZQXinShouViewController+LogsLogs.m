#import "BWRZQXinShouViewController+LogsLogs.h"
@implementation BWRZQXinShouViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)prepareForSegueSenderLogsLogs:(NSInteger)logs {
    return logs % 19 == 0;
}

@end
