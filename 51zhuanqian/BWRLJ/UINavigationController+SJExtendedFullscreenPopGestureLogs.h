#import <UIKit/UIKit.h>
#import "SJFullscreenPopGesture.h"
#import <objc/message.h>
#import <WebKit/WebKit.h>

@interface UINavigationController (SJExtendedFullscreenPopGestureLogs)
+ (BOOL)sj_fullscreenGestureStateLogs:(NSInteger)logs;

@end
