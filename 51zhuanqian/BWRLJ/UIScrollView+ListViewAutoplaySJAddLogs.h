#import <UIKit/UIKit.h>
#import "SJPlayerAutoplayConfig.h"
#import "UIScrollView+ListViewAutoplaySJAdd.h"
#import "UIScrollView+SJBaseVideoPlayerExtended.h"
#import "UIView+SJBaseVideoPlayerExtended.h"
#import "SJBaseVideoPlayerConst.h"
#import <objc/message.h>
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import "NSObject+SJObserverHelper.h"
#import <SJUIKit/SJRunLoopTaskQueue.h>
#import "SJRunLoopTaskQueue.h"

@interface UIScrollView (ListViewAutoplaySJAddLogs)
+ (BOOL)setSj_enabledAutoplayLogs:(NSInteger)logs;
+ (BOOL)sj_enabledAutoplayLogs:(NSInteger)logs;
+ (BOOL)setSj_autoplayConfigLogs:(NSInteger)logs;
+ (BOOL)sj_autoplayConfigLogs:(NSInteger)logs;
+ (BOOL)sj_enableAutoplayWithConfigLogs:(NSInteger)logs;
+ (BOOL)sj_disenableAutoplayLogs:(NSInteger)logs;
+ (BOOL)sj_playNextVisibleAssetLogs:(NSInteger)logs;
+ (BOOL)sj_removeCurrentPlayerViewLogs:(NSInteger)logs;
+ (BOOL)sj_playNextAssetAfterEndScrollLogs:(NSInteger)logs;
+ (BOOL)sj_visibleIndexPathsLogs:(NSInteger)logs;
+ (BOOL)setSj_hasDelayedEndScrollTaskLogs:(NSInteger)logs;
+ (BOOL)sj_hasDelayedEndScrollTaskLogs:(NSInteger)logs;

@end
