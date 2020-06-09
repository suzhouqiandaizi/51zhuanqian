#import "SJBaseVideoPlayer+NetworkLogs.h"
@implementation SJBaseVideoPlayer (NetworkLogs)
+ (BOOL)setReachabilityLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)reachabilityLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)_needUpdateReachabilityPropertiesLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)reachabilityObserverLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
