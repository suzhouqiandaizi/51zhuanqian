#import "CustomNavigationCoutroller+LogsLogs.h"
@implementation CustomNavigationCoutroller (LogsLogs)
+ (BOOL)initLogsLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)initWithRootViewControllerLogsLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
