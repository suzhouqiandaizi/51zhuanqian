#import <Foundation/Foundation.h>
#import "SJAVBasePlayer.h"
#import "SJAVMediaPlayer.h"

@interface SJAVMediaPlayer (Logs)
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)initWithURLSpecifystarttimeLogs:(NSInteger)logs;
+ (BOOL)initWithAVAssetSpecifystarttimeLogs:(NSInteger)logs;
+ (BOOL)initWithPlayerItemSpecifystarttimeLogs:(NSInteger)logs;
+ (BOOL)setSj_minBufferedDurationLogs:(NSInteger)logs;
+ (BOOL)sj_minBufferedDurationLogs:(NSInteger)logs;
+ (BOOL)setSj_rateLogs:(NSInteger)logs;
+ (BOOL)sj_rateLogs:(NSInteger)logs;
+ (BOOL)replayLogs:(NSInteger)logs;
+ (BOOL)playLogs:(NSInteger)logs;
+ (BOOL)reportLogs:(NSInteger)logs;
+ (BOOL)sj_postNotificationLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;
+ (BOOL)_sj_initObservationsLogs:(NSInteger)logs;
+ (BOOL)_sj_playableDurationDidChangeLogs:(NSInteger)logs;
+ (BOOL)_sj_presentationSizeDidChangeLogs:(NSInteger)logs;
+ (BOOL)_sj_durationDidChangeLogs:(NSInteger)logs;
+ (BOOL)_sj_newAcessLogEntryLogs:(NSInteger)logs;
+ (BOOL)_sj_playbackTypeDidChangeLogs:(NSInteger)logs;
+ (BOOL)_sj_didPlayToEndTimeLogs:(NSInteger)logs;
+ (BOOL)sj_audioSessionInterruptionLogs:(NSInteger)logs;
+ (BOOL)sj_audioSessionRouteChangeLogs:(NSInteger)logs;

@end
