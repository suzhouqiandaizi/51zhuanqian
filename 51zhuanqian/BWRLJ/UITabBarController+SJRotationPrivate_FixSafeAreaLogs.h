#import <UIKit/UIKit.h>
#import "UIViewController+SJRotationPrivate_FixSafeArea.h"
#import "SJBaseVideoPlayer.h"
#import "SJBaseVideoPlayerConst.h"
#import <objc/message.h>

@interface UITabBarController (SJRotationPrivate_FixSafeAreaLogs)
+ (BOOL)sj_containsPlayerViewLogs:(NSInteger)logs;

@end
