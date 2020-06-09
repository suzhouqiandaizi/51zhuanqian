#import "UIScrollView+SJPlayerCurrentPlayingIndexPathLogs.h"
@implementation UIScrollView (SJPlayerCurrentPlayingIndexPathLogs)
+ (BOOL)setSj_currentPlayingIndexPathLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)sj_currentPlayingIndexPathLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
