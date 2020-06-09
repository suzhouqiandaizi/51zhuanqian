#import "SJPlayModel.h"
#import "SJPlayModelPropertiesObserver.h"
#import "UIView+SJBaseVideoPlayerExtended.h"
#import <objc/message.h>
#import <SJUIKit/SJRunLoopTaskQueue.h>
#import "SJRunLoopTaskQueue.h"
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import "NSObject+SJObserverHelper.h"

@interface SJPlayModelPropertiesObserver (Logs)
+ (BOOL)initWithPlayModelLogs:(NSInteger)logs;
+ (BOOL)_observePropertiesLogs:(NSInteger)logs;
+ (BOOL)_observeScrollViewLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;
+ (BOOL)_panGestureStateDidChangeLogs:(NSInteger)logs;
+ (BOOL)_isAppearedInTheScrollingViewLogs:(NSInteger)logs;
+ (BOOL)_scrollViewDidScrollLogs:(NSInteger)logs;
+ (BOOL)setIsAppearedLogs:(NSInteger)logs;
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs;
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs;
+ (BOOL)refreshAppearStateLogs:(NSInteger)logs;
+ (BOOL)isScrollingLogs:(NSInteger)logs;

@end
