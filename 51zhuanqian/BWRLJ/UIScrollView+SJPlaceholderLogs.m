#import "UIScrollView+SJPlaceholderLogs.h"
@implementation UIScrollView (SJPlaceholderLogs)
+ (BOOL)sj_placeholderViewLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)_showOrHiddenPlaceholderViewIfNeededLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
