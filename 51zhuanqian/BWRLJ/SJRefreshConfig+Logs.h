#import <UIKit/UIKit.h>
#import "UIScrollView+SJRefreshAdd.h"
#import <objc/message.h>
#import "MJRefresh.h"

@interface SJRefreshConfig (Logs)
+ (BOOL)initWithScrollViewLogs:(NSInteger)logs;
+ (BOOL)configHeaderLogs:(NSInteger)logs;
+ (BOOL)configFooterLogs:(NSInteger)logs;
+ (BOOL)setIgnoredTopEdgeInsetLogs:(NSInteger)logs;
+ (BOOL)ignoredTopEdgeInsetLogs:(NSInteger)logs;

@end
