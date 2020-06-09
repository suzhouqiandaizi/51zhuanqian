#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"
#import "UIScrollView+MJExtension.h"
#import "UIScrollView+MJRefresh.h"
#import "NSBundle+MJRefresh.h"
#import "MJRefreshComponent.h"
#import "MJRefreshConst.h"

@interface MJRefreshComponent (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)placeSubviewsLogs:(NSInteger)logs;
+ (BOOL)willMoveToSuperviewLogs:(NSInteger)logs;
+ (BOOL)drawRectLogs:(NSInteger)logs;
+ (BOOL)addObserversLogs:(NSInteger)logs;
+ (BOOL)removeObserversLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentOffsetDidChangeLogs:(NSInteger)logs;
+ (BOOL)scrollViewContentSizeDidChangeLogs:(NSInteger)logs;
+ (BOOL)scrollViewPanStateDidChangeLogs:(NSInteger)logs;
+ (BOOL)setRefreshingTargetRefreshingactionLogs:(NSInteger)logs;
+ (BOOL)setStateLogs:(NSInteger)logs;
+ (BOOL)beginRefreshingLogs:(NSInteger)logs;
+ (BOOL)beginRefreshingWithCompletionBlockLogs:(NSInteger)logs;
+ (BOOL)endRefreshingLogs:(NSInteger)logs;
+ (BOOL)endRefreshingWithCompletionBlockLogs:(NSInteger)logs;
+ (BOOL)isRefreshingLogs:(NSInteger)logs;
+ (BOOL)setAutoChangeAlphaLogs:(NSInteger)logs;
+ (BOOL)isAutoChangeAlphaLogs:(NSInteger)logs;
+ (BOOL)setAutomaticallyChangeAlphaLogs:(NSInteger)logs;
+ (BOOL)setPullingPercentLogs:(NSInteger)logs;
+ (BOOL)executeRefreshingCallbackLogs:(NSInteger)logs;

@end
