#import "MJRefreshAutoFooter.h"
#import "MJRefreshAutoStateFooter.h"

@interface MJRefreshAutoStateFooter (Logs)
+ (BOOL)stateTitlesLogs:(NSInteger)logs;
+ (BOOL)stateLabelLogs:(NSInteger)logs;
+ (BOOL)setTitleForstateLogs:(NSInteger)logs;
+ (BOOL)ignoreRefreshActionLogs:(NSInteger)logs;
+ (BOOL)stateLabelClickLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)placeSubviewsLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;

@end
