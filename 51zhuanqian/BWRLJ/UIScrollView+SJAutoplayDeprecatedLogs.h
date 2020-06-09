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

@interface UIScrollView (SJAutoplayDeprecatedLogs)
+ (BOOL)sj_needPlayNextAsset __deprecated_msg("use `sj_playNextVisibleAsset`")Logs:(NSInteger)logs;

@end
