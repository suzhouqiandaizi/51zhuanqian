#import "SJEdgeControlButtonItem+FrameLayoutLogs.h"
@implementation SJEdgeControlButtonItem (FrameLayoutLogs)
+ (BOOL)frameLayoutWithCustomViewTagLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)isFrameLayoutLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
