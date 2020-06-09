#import <UIKit/UIScrollView.h>
#import "IQUIScrollView+Additions.h"
#import <objc/runtime.h>

@interface UIScrollView (AdditionsLogs)
+ (BOOL)setShouldIgnoreScrollingAdjustmentLogs:(NSInteger)logs;
+ (BOOL)shouldIgnoreScrollingAdjustmentLogs:(NSInteger)logs;
+ (BOOL)setShouldRestoreScrollViewContentOffsetLogs:(NSInteger)logs;
+ (BOOL)shouldRestoreScrollViewContentOffsetLogs:(NSInteger)logs;

@end
