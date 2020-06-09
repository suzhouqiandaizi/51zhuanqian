#import <UIKit/UIKit.h>
#import "UIScrollView+SJRefreshAdd.h"
#import <objc/message.h>
#import "MJRefresh.h"

@interface UIScrollView (SJPlaceholderLogs)
+ (BOOL)sj_placeholderViewLogs:(NSInteger)logs;
+ (BOOL)_showOrHiddenPlaceholderViewIfNeededLogs:(NSInteger)logs;

@end
