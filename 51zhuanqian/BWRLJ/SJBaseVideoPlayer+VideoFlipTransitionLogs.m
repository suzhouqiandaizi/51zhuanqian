#import "SJBaseVideoPlayer+VideoFlipTransitionLogs.h"
@implementation SJBaseVideoPlayer (VideoFlipTransitionLogs)
+ (BOOL)setFlipTransitionManagerLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)flipTransitionManagerLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)flipTransitionObserverLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
