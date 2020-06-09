#import "SJBaseVideoPlayer+RotationLogs.h"
@implementation SJBaseVideoPlayer (RotationLogs)
+ (BOOL)setRotationManagerLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)rotationManagerLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)rotationObserverLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setShouldTriggerRotationLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))shouldTriggerRotationLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)_setupRotationManagerLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)rotateLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)rotateAnimatedLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)rotateAnimatedCompletionLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)isTransitioningLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)isFullScreenLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)currentOrientationLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setLockedScreenLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)isLockedScreenLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
