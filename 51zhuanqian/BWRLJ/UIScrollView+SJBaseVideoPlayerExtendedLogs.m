#import "UIScrollView+SJBaseVideoPlayerExtendedLogs.h"
@implementation UIScrollView (SJBaseVideoPlayerExtendedLogs)
+ (BOOL)viewWithTagAtindexpathLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)isViewAppearedWithTagAtindexpathLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
