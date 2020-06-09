#import <UIKit/UIKit.h>
#import "SJFullscreenPopGesture.h"
#import <objc/message.h>
#import <WebKit/WebKit.h>

@interface UINavigationController (_SJFullscreenPopGesturePrivateLogs)
+ (BOOL)loadLogs:(NSInteger)logs;
+ (BOOL)sj_pushViewControllerAnimatedLogs:(NSInteger)logs;
+ (BOOL)sj_setupIfNeededLogs:(NSInteger)logs;
+ (BOOL)sj_fullscreenGestureLogs:(NSInteger)logs;
+ (BOOL)sj_handleFullscreenGestureLogs:(NSInteger)logs;

@end
