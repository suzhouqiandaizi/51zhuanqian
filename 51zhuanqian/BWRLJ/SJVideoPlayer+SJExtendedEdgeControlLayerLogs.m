#import "SJVideoPlayer+SJExtendedEdgeControlLayerLogs.h"
@implementation SJVideoPlayer (SJExtendedEdgeControlLayerLogs)
+ (BOOL)setShowMoreItemToTopControlLayerLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)showMoreItemToTopControlLayerLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
