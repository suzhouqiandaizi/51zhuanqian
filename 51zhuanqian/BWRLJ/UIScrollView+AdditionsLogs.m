#import "UIScrollView+AdditionsLogs.h"
@implementation UIScrollView (AdditionsLogs)
+ (BOOL)setShouldIgnoreScrollingAdjustmentLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)shouldIgnoreScrollingAdjustmentLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setShouldRestoreScrollViewContentOffsetLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)shouldRestoreScrollViewContentOffsetLogs:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
