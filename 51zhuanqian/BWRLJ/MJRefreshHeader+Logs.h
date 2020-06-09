#import "MJRefreshComponent.h"
#import "MJRefreshHeader.h"

@interface MJRefreshHeader (Logs)
+ (BOOL)headerWithRefreshingBlockLogs:(NSInteger)logs;
+ (BOOL)headerWithRefreshingTargetRefreshingactionLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)placeSubviewsLogs:(NSInteger)logs;
+ (BOOL)resetInsetLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;
+ (BOOL)lastUpdatedTimeLogs:(NSInteger)logs;
+ (BOOL)setIgnoredScrollViewContentInsetTopLogs:(NSInteger)logs;

@end
