#import "WYZQXNLocationManager+Logs.h"
@implementation WYZQXNLocationManager (Logs)
+ (BOOL)locationStartLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)locationManagerDidupdatelocationsLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)locationManagerDidfailwitherrorLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
