#import "MJRefreshComponent.h"
#import "MJRefreshFooter.h"

@interface MJRefreshFooter (Logs)
+ (BOOL)footerWithRefreshingBlockLogs:(NSInteger)logs;
+ (BOOL)footerWithRefreshingTargetRefreshingactionLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)endRefreshingWithNoMoreDataLogs:(NSInteger)logs;
+ (BOOL)noticeNoMoreDataLogs:(NSInteger)logs;
+ (BOOL)resetNoMoreDataLogs:(NSInteger)logs;
+ (BOOL)setAutomaticallyHiddenLogs:(NSInteger)logs;

@end
