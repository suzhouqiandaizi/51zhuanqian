#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"
#import "UIScrollView+MJExtension.h"
#import "UIScrollView+MJRefresh.h"
#import "NSBundle+MJRefresh.h"
#import "MJRefreshComponent.h"
#import "MJRefreshConst.h"

@interface UILabel (MJRefreshLogs)
+ (BOOL)mj_labelLogs:(NSInteger)logs;
+ (BOOL)mj_textWidthLogs:(NSInteger)logs;

@end
