#import "SJFullscreenPopGesture+Logs.h"
@implementation SJFullscreenPopGesture (Logs)
+ (BOOL)setGestureTypeLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)gestureTypeLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setTransitionModeLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)transitionModeLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setMaxOffsetToTriggerPopLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)maxOffsetToTriggerPopLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
