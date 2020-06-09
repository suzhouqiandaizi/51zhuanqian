#import "SJSwitchVideoDefinitionControlLayer+Logs.h"
@implementation SJSwitchVideoDefinitionControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)controlViewLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)exitControlLayerLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)restartControlLayerLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)_clickedItemLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)selectedTextColorLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)setAssetsLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)_refreshItemsLogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
