#import "SJNetworkLoadingView+Logs.h"
@implementation SJNetworkLoadingView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)_setupViewLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setLineColorLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)lineColorLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)isAnimatingLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)startLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)stopLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)_startLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)_stopLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)setNetworkSpeedStrLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)networkSpeedStrLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
