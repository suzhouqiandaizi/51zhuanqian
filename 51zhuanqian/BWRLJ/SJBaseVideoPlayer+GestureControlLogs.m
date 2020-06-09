#import "SJBaseVideoPlayer+GestureControlLogs.h"
@implementation SJBaseVideoPlayer (GestureControlLogs)
+ (BOOL)gestureControlLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)setGestureRecognizerShouldTriggerLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull, SJPlayerGestureType, CGPoint))gestureRecognizerShouldTriggerLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)setFastForwardViewControllerLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)fastForwardViewControllerLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)_needUpdateFastForwardControllerPropertiesLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)setAllowHorizontalTriggeringOfPanGesturesInCellsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)allowHorizontalTriggeringOfPanGesturesInCellsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
