#import "SharedViewControllers+LogsLogs.h"
@implementation SharedViewControllers (LogsLogs)
+ (BOOL)homeViewConLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)tuiguangViewConLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)personViewConLogsLogs:(NSInteger)logs {
    return logs % 35 == 0;
}

@end
