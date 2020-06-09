#import "BWRZQSubmitSuccessInfoView+LogsLogs.h"
@implementation BWRZQSubmitSuccessInfoView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
