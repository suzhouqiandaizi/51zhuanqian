#import "BWRZQPersonEditViewController+LogsLogs.h"
@implementation BWRZQPersonEditViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)viewDidAppearLogsLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)deallocLogsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)cancelPressLogsLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)finishPressLogsLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
