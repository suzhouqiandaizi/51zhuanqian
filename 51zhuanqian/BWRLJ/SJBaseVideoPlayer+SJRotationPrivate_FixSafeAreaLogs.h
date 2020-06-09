#import <UIKit/UIKit.h>
#import "UIViewController+SJRotationPrivate_FixSafeArea.h"
#import "SJBaseVideoPlayer.h"
#import "SJBaseVideoPlayerConst.h"
#import <objc/message.h>

@interface SJBaseVideoPlayer (SJRotationPrivate_FixSafeAreaLogs)
+ (BOOL)initializeLogs:(NSInteger)logs;

@end
