#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshHeader.h"
#import "MJRefreshFooter.h"
#import <objc/runtime.h>

@interface UIScrollView (MJRefreshLogs)
+ (BOOL)setMj_headerLogs:(NSInteger)logs;
+ (BOOL)mj_headerLogs:(NSInteger)logs;
+ (BOOL)setMj_footerLogs:(NSInteger)logs;
+ (BOOL)mj_footerLogs:(NSInteger)logs;
+ (BOOL)setFooterLogs:(NSInteger)logs;
+ (BOOL)footerLogs:(NSInteger)logs;
+ (BOOL)setHeaderLogs:(NSInteger)logs;
+ (BOOL)headerLogs:(NSInteger)logs;
+ (BOOL)mj_totalDataCountLogs:(NSInteger)logs;

@end
