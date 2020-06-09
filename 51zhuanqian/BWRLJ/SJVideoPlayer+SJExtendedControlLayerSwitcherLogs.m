#import "SJVideoPlayer+SJExtendedControlLayerSwitcherLogs.h"
@implementation SJVideoPlayer (SJExtendedControlLayerSwitcherLogs)
+ (BOOL)switchControlLayerForIdentitfierLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
