#import "UIScrollView+MJRefreshLogs.h"
@implementation UIScrollView (MJRefreshLogs)
+ (BOOL)setMj_headerLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)mj_headerLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)setMj_footerLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)mj_footerLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)setFooterLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)footerLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setHeaderLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)headerLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)mj_totalDataCountLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
