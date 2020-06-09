#import <UIKit/UIKit.h>
#import "SGPageContentView.h"
#import "UIView+SGFrame.h"

@interface SGPageContentView (Logs)
+ (BOOL)initWithFrameParentvcChildvcsLogs:(NSInteger)logs;
+ (BOOL)pageContentViewWithFrameParentvcChildvcsLogs:(NSInteger)logs;
+ (BOOL)collectionViewLogs:(NSInteger)logs;
+ (BOOL)setupLogs:(NSInteger)logs;
+ (BOOL)collectionViewNumberofitemsinsectionLogs:(NSInteger)logs;
+ (BOOL)collectionViewCellforitematindexpathLogs:(NSInteger)logs;
+ (BOOL)scrollViewWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidEndDeceleratingLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidScrollLogs:(NSInteger)logs;
+ (BOOL)setPageCententViewCurrentIndexLogs:(NSInteger)logs;
+ (BOOL)setIsScrollEnabledLogs:(NSInteger)logs;

@end
