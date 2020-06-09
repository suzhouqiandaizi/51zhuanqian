#import "MJRefreshFooter.h"
#import "MJRefreshBackFooter.h"

@interface MJRefreshBackFooter (Logs)
+ (BOOL)willMoveToSuperviewLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentSizeDidChangeLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;
+ (BOOL)heightForContentBreakViewLogs:(NSInteger)logs;
+ (BOOL)happenOffsetYLogs:(NSInteger)logs;

@end
