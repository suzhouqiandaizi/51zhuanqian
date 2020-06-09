#import <AVFoundation/AVFoundation.h>
#import "SJAVBasePlayerItem.h"

@interface SJAVBasePlayerItemObserver (Logs)
+ (BOOL)initWithBasePlayerItemLogs:(NSInteger)logs;
+ (BOOL)playerItemStatusDidChangeLogs:(NSInteger)logs;
+ (BOOL)playbackLikelyToKeepUpDidChangeLogs:(NSInteger)logs;
+ (BOOL)playbackBufferEmptyDidChangeLogs:(NSInteger)logs;
+ (BOOL)playbackBufferFullDidChangeLogs:(NSInteger)logs;
+ (BOOL)loadedTimeRangesDidChangeLogs:(NSInteger)logs;
+ (BOOL)presentationSizeDidChangeLogs:(NSInteger)logs;
+ (BOOL)failedToPlayToEndTimeLogs:(NSInteger)logs;
+ (BOOL)didPlayToEndTimeLogs:(NSInteger)logs;
+ (BOOL)newAccessLogEntryLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;

@end
