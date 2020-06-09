#import <UIKit/UIKit.h>
#import "UIScrollView+SJRefreshAdd.h"
#import <objc/message.h>
#import "MJRefresh.h"

@interface UIScrollView (SJSetupRefreshLogs)
+ (BOOL)sj_setupRefreshingWithRefreshingBlockLogs:(NSInteger)logs;
+ (BOOL)sj_setupRefreshingWithPageSizeBeginpagenumRefreshingblockLogs:(NSInteger)logs;
+ (BOOL)sj_setupFooterRefreshingWithPageSizeBeginpagenumRefreshingblockLogs:(NSInteger)logs;
+ (BOOL)_sj_setupRefreshingWithEnableHeaderEnablefooterPagesizeBeginpagenumRefreshingblockLogs:(NSInteger)logs;
+ (BOOL)sj_endRefreshingWithItemCountLogs:(NSInteger)logs;
+ (BOOL)sj_endRefreshingLogs:(NSInteger)logs;
+ (BOOL)sj_exeHeaderRefreshingLogs:(NSInteger)logs;
+ (BOOL)sj_exeHeaderRefreshingAnimatedLogs:(NSInteger)logs;
+ (BOOL)sj_exeFooterRefreshingLogs:(NSInteger)logs;
+ (BOOL)sj_resetStateLogs:(NSInteger)logs;
+ (BOOL)setSj_beginPageNumLogs:(NSInteger)logs;
+ (BOOL)sj_beginPageNumLogs:(NSInteger)logs;
+ (BOOL)setSj_pageNumLogs:(NSInteger)logs;
+ (BOOL)sj_pageNumLogs:(NSInteger)logs;
+ (BOOL)setSj_pageSizeLogs:(NSInteger)logs;
+ (BOOL)sj_pageSizeLogs:(NSInteger)logs;

@end
