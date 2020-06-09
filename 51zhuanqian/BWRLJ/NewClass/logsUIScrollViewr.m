#import "logsUIScrollViewr.h"
@implementation logsUIScrollViewr
+ (BOOL)RSj_Setuprefreshingwithrefreshingblock:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)USj_SetuprefreshingwithpagesizehBeginpagenumxRefreshingblock:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)kSj_SetupfooterrefreshingwithpagesizePBeginpagenumhRefreshingblock:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)K_Sj_SetuprefreshingwithenableheaderNEnablefootertPagesizeQBeginpagenumnRefreshingblock:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)LSj_Endrefreshingwithitemcount:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)Ssj_endRefreshing:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)zsj_exeHeaderRefreshing:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)eSj_Exeheaderrefreshinganimated:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)gsj_exeFooterRefreshing:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)Ssj_resetState:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)bSetsj_Beginpagenum:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)Nsj_beginPageNum:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)NSetsj_Pagenum:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)Qsj_pageNum:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)SSetsj_Pagesize:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)Bsj_pageSize:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
