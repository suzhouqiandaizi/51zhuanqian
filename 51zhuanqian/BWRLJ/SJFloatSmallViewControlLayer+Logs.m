#import "SJFloatSmallViewControlLayer+Logs.h"
@implementation SJFloatSmallViewControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)hitTestWitheventLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)controlViewLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)restartControlLayerLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)exitControlLayerLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)tappedCloseItemLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)_setupViewLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
