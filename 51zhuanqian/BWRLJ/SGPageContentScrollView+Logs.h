#import <UIKit/UIKit.h>
#import "SGPageContentScrollView.h"
#import "UIView+SGFrame.h"

@interface SGPageContentScrollView (Logs)
+ (BOOL)initWithFrameParentvcChildvcsLogs:(NSInteger)logs;
+ (BOOL)pageContentScrollViewWithFrameParentvcChildvcsLogs:(NSInteger)logs;
+ (BOOL)scrollViewLogs:(NSInteger)logs;
+ (BOOL)initializationLogs:(NSInteger)logs;
+ (BOOL)setupSubviewsLogs:(NSInteger)logs;
+ (BOOL)scrollViewWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidEndDeceleratingLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidScrollLogs:(NSInteger)logs;
+ (BOOL)setPageCententScrollViewCurrentIndexLogs:(NSInteger)logs;
+ (BOOL)setIsScrollEnabledLogs:(NSInteger)logs;

@end
