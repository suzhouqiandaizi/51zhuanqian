#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"
#import <objc/runtime.h>

@interface UIViewController (FDFullscreenPopGesturePrivateLogs)
+ (BOOL)loadLogs:(NSInteger)logs;
+ (BOOL)fd_viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)fd_viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)fd_willAppearInjectBlockLogs:(NSInteger)logs;
+ (BOOL)setFd_willAppearInjectBlockLogs:(NSInteger)logs;

@end
