#import "BWRZQXNLocationManager+Logs.h"
@implementation BWRZQXNLocationManager (Logs)
+ (BOOL)locationStartLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)locationManagerDidupdatelocationsLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)locationManagerDidfailwitherrorLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
