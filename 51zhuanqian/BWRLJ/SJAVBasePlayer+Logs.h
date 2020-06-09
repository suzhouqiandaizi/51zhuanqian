#import <AVFoundation/AVFoundation.h>
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJAVBasePlayerItem.h"
#import "SJAVBasePlayer.h"

@interface SJAVBasePlayer (Logs)
+ (BOOL)initWithBasePlayerItemLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)addPeriodicTimeObserverForIntervalQueueUsingblockLogs:(NSInteger)logs;
+ (BOOL)addBoundaryTimeObserverForTimesQueueUsingblockLogs:(NSInteger)logs;
+ (BOOL)removeTimeObserverLogs:(NSInteger)logs;
+ (BOOL)sj_errorLogs:(NSInteger)logs;
+ (BOOL)playLogs:(NSInteger)logs;
+ (BOOL)sj_playImmediatelyAtRateLogs:(NSInteger)logs;
+ (BOOL)setRateLogs:(NSInteger)logs;
+ (BOOL)pauseLogs:(NSInteger)logs;
+ (BOOL)seekToTimeLogs:(NSInteger)logs;
+ (BOOL)seekToTimeTolerancebeforeToleranceafterLogs:(NSInteger)logs;
+ (BOOL)seekToTimeTolerancebeforeToleranceafterCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)currentTimeLogs:(NSInteger)logs;
+ (BOOL)_willSeekingLogs:(NSInteger)logs;
+ (BOOL)_didEndSeekingLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;
+ (BOOL)_sjbase_initObservationsLogs:(NSInteger)logs;
+ (BOOL)_sjbase_initItemObserverLogs:(NSInteger)logs;
+ (BOOL)_sjbase_toEvaluatingLogs:(NSInteger)logs;
+ (BOOL)_sjbase_refreshPlayerStatusLogs:(NSInteger)logs;
+ (BOOL)sj_periodicTimeObserversLogs:(NSInteger)logs;

@end
