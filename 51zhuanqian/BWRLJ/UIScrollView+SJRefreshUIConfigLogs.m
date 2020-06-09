#import "UIScrollView+SJRefreshUIConfigLogs.h"
@implementation UIScrollView (SJRefreshUIConfigLogs)
+ (BOOL)sj_commonConfigLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)sj_refreshConfigLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
