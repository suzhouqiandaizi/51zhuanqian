#import "MJRefreshFooter.h"
#import "MJRefreshAutoFooter.h"

@interface MJRefreshAutoFooter (Logs)
+ (BOOL)willMoveToSuperviewLogs:(NSInteger)logs;
+ (BOOL)setAppearencePercentTriggerAutoRefreshLogs:(NSInteger)logs;
+ (BOOL)appearencePercentTriggerAutoRefreshLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentSizeDidChangeLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs;
+ (BOOL)scrollViewPanStateDidChangeLogs:(NSInteger)logs;
+ (BOOL)ignoreRefreshActionLogs:(NSInteger)logs;
+ (BOOL)beginRefreshingLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;
+ (BOOL)setHiddenLogs:(NSInteger)logs;

@end
