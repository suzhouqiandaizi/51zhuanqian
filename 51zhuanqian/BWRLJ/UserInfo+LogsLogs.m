#import "UserInfo+LogsLogs.h"
@implementation UserInfo (LogsLogs)
+ (BOOL)initLogsLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)encodeWithCoderLogsLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)initWithCoderLogsLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
