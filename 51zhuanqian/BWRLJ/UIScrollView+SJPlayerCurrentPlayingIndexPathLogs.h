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

@interface UIScrollView (SJPlayerCurrentPlayingIndexPathLogs)
+ (BOOL)setSj_currentPlayingIndexPathLogs:(NSInteger)logs;
+ (BOOL)sj_currentPlayingIndexPathLogs:(NSInteger)logs;

@end
