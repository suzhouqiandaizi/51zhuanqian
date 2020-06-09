#import "UIView+animationLogs.h"
@implementation UIView (animationLogs)
+ (BOOL)ytRotateWithanimationLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)ytHeartbeatLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)ytHeartbeatAmplitudeLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)ytShakeLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)ytShakeAmplitudeLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
