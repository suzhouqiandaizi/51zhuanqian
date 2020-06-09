#import "CALayer+SJBaseVideoPlayerExtendedLogs.h"
@implementation CALayer (SJBaseVideoPlayerExtendedLogs)
+ (BOOL)pauseAnimationLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)resumeAnimationLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)addAnimationStarthandlerLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)addAnimationStophandlerLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)addAnimationStarthandlerStophandlerLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
