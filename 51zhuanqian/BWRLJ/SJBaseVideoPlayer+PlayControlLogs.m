#import "SJBaseVideoPlayer+PlayControlLogs.h"
@implementation SJBaseVideoPlayer (PlayControlLogs)
+ (BOOL)setPlaybackControllerLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)playbackControllerLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)_needUpdatePlaybackControllerPropertiesLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)playbackObserverLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)switchVideoDefinitionLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)definitionSwitchingInfoLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)_resetDefinitionSwitchingInfoLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)playbackTypeLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)errorLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)assetStatusLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)timeControlStatusLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)reasonForWaitingToPlayLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)isPlayedToEndTimeLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)isPlayedLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)isReplayedLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)currentTimeLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)durationLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)playableDurationLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)durationWatchedLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)stringForSecondsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)setURLAssetLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)URLAssetLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)_tryToPlayIfNeededLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)_updateAssetObserversLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)refreshLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)setAssetDeallocExeBlockLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))assetDeallocExeBlockLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)setPlayerVolumeLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)playerVolumeLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)setMutedLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)isMutedLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)setAutoplayWhenSetNewAssetLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)autoplayWhenSetNewAssetLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)setPauseWhenAppDidEnterBackgroundLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)pauseWhenAppDidEnterBackgroundLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)setResumePlaybackWhenAppDidEnterForegroundLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)resumePlaybackWhenAppDidEnterForegroundLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)setCanPlayAnAssetLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))canPlayAnAssetLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setResumePlaybackWhenPlayerHasFinishedSeekingLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)resumePlaybackWhenPlayerHasFinishedSeekingLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)playLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)pauseLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)stopLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)replayLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)setCanSeekToTimeLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))canSeekToTimeLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)setAccurateSeekingLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)accurateSeekingLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)seekToTimeCompletionhandlerLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)seekToTimeTolerancebeforeToleranceafterCompletionhandlerLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)setRateLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)rateLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)_updatePlayModelObserverLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)playbackControllerAssetstatusdidchangeLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)playbackControllerTimecontrolstatusdidchangeLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)playbackControllerDurationdidchangeLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)playbackControllerCurrenttimedidchangeLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)mediaDidPlayToEndForPlaybackControllerLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)playbackControllerPresentationsizedidchangeLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)playbackControllerPlaybacktypedidchangeLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)playbackControllerPlayabledurationdidchangeLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)playbackControllerIsReadyForDisplayLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)playbackControllerSwitchingdefinitionstatusdidchangeMediaLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
