#import "MJRefreshHeader.h"
#import "MJRefreshStateHeader.h"

@interface MJRefreshStateHeader (Logs)
+ (BOOL)stateTitlesLogs:(NSInteger)logs;
+ (BOOL)stateLabelLogs:(NSInteger)logs;
+ (BOOL)lastUpdatedTimeLabelLogs:(NSInteger)logs;
+ (BOOL)setTitleForstateLogs:(NSInteger)logs;
+ (BOOL)setLastUpdatedTimeKeyLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)placeSubviewsLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;

@end
