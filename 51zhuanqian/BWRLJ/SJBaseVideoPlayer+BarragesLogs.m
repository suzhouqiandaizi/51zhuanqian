#import "SJBaseVideoPlayer+BarragesLogs.h"
@implementation SJBaseVideoPlayer (BarragesLogs)
+ (BOOL)setBarrageQueueControllerLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)barrageQueueControllerLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
