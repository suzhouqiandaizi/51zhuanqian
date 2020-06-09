#import <QuartzCore/QuartzCore.h>
#import "CALayer+SJBaseVideoPlayerExtended.h"
#import <objc/message.h>

@interface CALayer (SJBaseVideoPlayerExtendedLogs)
+ (BOOL)pauseAnimationLogs:(NSInteger)logs;
+ (BOOL)resumeAnimationLogs:(NSInteger)logs;
+ (BOOL)addAnimationStarthandlerLogs:(NSInteger)logs;
+ (BOOL)addAnimationStophandlerLogs:(NSInteger)logs;
+ (BOOL)addAnimationStarthandlerStophandlerLogs:(NSInteger)logs;

@end
