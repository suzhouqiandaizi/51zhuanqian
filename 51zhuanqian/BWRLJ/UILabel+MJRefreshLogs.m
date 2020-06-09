#import "UILabel+MJRefreshLogs.h"
@implementation UILabel (MJRefreshLogs)
+ (BOOL)mj_labelLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)mj_textWidthLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
