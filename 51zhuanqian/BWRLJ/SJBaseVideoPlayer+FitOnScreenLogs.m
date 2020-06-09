#import "SJBaseVideoPlayer+FitOnScreenLogs.h"
@implementation SJBaseVideoPlayer (FitOnScreenLogs)
+ (BOOL)setUseFitOnScreenAndDisableRotationLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)useFitOnScreenAndDisableRotationLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)setFitOnScreenManagerLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)fitOnScreenManagerLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)fitOnScreenObserverLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)_setupFitOnScreenManagerLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)isFitOnScreenLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)setFitOnScreenLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)setFitOnScreenAnimatedLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)setFitOnScreenAnimatedCompletionhandlerLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
