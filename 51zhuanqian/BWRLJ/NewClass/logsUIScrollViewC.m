#import "logsUIScrollViewc.h"
@implementation logsUIScrollViewc
+ (BOOL)Usj_placeholderView:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)H_showOrHiddenPlaceholderViewIfNeeded:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
