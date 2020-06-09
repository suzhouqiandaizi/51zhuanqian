#import "UIScrollView+SJSetupRefreshLogs.h"
@implementation UIScrollView (SJSetupRefreshLogs)
+ (BOOL)sj_setupRefreshingWithRefreshingBlockLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)sj_setupRefreshingWithPageSizeBeginpagenumRefreshingblockLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)sj_setupFooterRefreshingWithPageSizeBeginpagenumRefreshingblockLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)_sj_setupRefreshingWithEnableHeaderEnablefooterPagesizeBeginpagenumRefreshingblockLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)sj_endRefreshingWithItemCountLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)sj_endRefreshingLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)sj_exeHeaderRefreshingLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)sj_exeHeaderRefreshingAnimatedLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)sj_exeFooterRefreshingLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)sj_resetStateLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)setSj_beginPageNumLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)sj_beginPageNumLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)setSj_pageNumLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)sj_pageNumLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)setSj_pageSizeLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)sj_pageSizeLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
