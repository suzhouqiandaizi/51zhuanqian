#import <UIKit/UIKit.h>
#import "UIScrollView+SJRefreshAdd.h"
#import <objc/message.h>
#import "MJRefresh.h"

@interface SJPlaceholderView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)clickedBackgroundLogs:(NSInteger)logs;
+ (BOOL)setInsetsLogs:(NSInteger)logs;
+ (BOOL)labelLogs:(NSInteger)logs;
+ (BOOL)_needRefreshLabelConstraintsLogs:(NSInteger)logs;

@end
