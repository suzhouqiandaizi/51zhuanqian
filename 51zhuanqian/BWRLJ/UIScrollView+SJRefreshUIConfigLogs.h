#import <UIKit/UIKit.h>
#import "UIScrollView+SJRefreshAdd.h"
#import <objc/message.h>
#import "MJRefresh.h"

@interface UIScrollView (SJRefreshUIConfigLogs)
+ (BOOL)sj_commonConfigLogs:(NSInteger)logs;
+ (BOOL)sj_refreshConfigLogs:(NSInteger)logs;

@end
