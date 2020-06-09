#import <Foundation/Foundation.h>
#import "SJPlaybackObservation.h"
#import "SJBaseVideoPlayerConst.h"

@interface SJPlaybackObservation (Logs)
+ (BOOL)initWithPlayerLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;

@end
