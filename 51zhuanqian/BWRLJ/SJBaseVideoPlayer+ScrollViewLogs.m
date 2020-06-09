#import "SJBaseVideoPlayer+ScrollViewLogs.h"
@implementation SJBaseVideoPlayer (ScrollViewLogs)
+ (BOOL)setFloatSmallViewControllerLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)floatSmallViewControllerLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)_resetFloatSmallViewControllerObserverLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setAutoDisappearFloatSmallViewLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)autoDisappearFloatSmallViewLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setPauseWhenScrollDisappearedLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)pauseWhenScrollDisappearedLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)setHiddenViewWhenScrollDisappearedLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)hiddenViewWhenScrollDisappearedLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)setResumePlaybackWhenScrollAppearedLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)resumePlaybackWhenScrollAppearedLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)isPlayOnScrollViewLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)isScrollAppearedLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)setPlayerViewWillAppearExeBlockLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))playerViewWillAppearExeBlockLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)setPlayerViewWillDisappearExeBlockLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))playerViewWillDisappearExeBlockLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
