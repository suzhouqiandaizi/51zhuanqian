#import "BWRZQXNLocationManager+LogsLogs.h"
@implementation BWRZQXNLocationManager (LogsLogs)
+ (BOOL)locationStartLogsLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)locationManagerDidupdatelocationsLogsLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)locationManagerDidfailwitherrorLogsLogs:(NSInteger)logs {
    return logs % 35 == 0;
}

@end
