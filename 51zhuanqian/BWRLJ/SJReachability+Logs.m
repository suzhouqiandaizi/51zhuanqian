#import "SJReachability+Logs.h"
@implementation SJReachability (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)getObserverLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)networkSpeedStrLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)_initializeReachabilityLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)reachabilityChangedLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)_updateNetworkStatusLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)_initializeSpeedObserverLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)startRefreshLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)stopRefreshLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)setNetworkStatusLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
