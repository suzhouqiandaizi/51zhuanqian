#import "BWRZQLoginPrivacyProtocolView+LogsLogs.h"
@implementation BWRZQLoginPrivacyProtocolView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)exitPressLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)agreePressLogsLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
