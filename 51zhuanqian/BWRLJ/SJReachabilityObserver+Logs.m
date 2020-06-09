#import "SJReachabilityObserver+Logs.h"
@implementation SJReachabilityObserver (Logs)
+ (BOOL)initWithReachabilityLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)networkStatusDidChangeLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)networkSpeedDidChangeLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
