#import "SJBaseVideoPlayer+ControlLayerLogs.h"
@implementation SJBaseVideoPlayer (ControlLayerLogs)
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)setControlLayerAppearManagerLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)controlLayerAppearManagerLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)controlLayerAppearObserverLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)setCanAutomaticallyDisappearLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))canAutomaticallyDisappearLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)_setupControlLayerAppearManagerLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)setControlLayerAppearedLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)isControlLayerAppearedLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)setPausedToKeepAppearStateLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)pausedToKeepAppearStateLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
