#import "MJRefreshStateHeader.h"
#import "MJRefreshNormalHeader.h"
#import "NSBundle+MJRefresh.h"

@interface MJRefreshNormalHeader (Logs)
+ (BOOL)arrowViewLogs:(NSInteger)logs;
+ (BOOL)loadingViewLogs:(NSInteger)logs;
+ (BOOL)setActivityIndicatorViewStyleLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)placeSubviewsLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;

@end
