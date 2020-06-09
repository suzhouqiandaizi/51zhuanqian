#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"
#import <objc/runtime.h>

@interface UINavigationController (FDFullscreenPopGestureLogs)
+ (BOOL)loadLogs:(NSInteger)logs;
+ (BOOL)fd_pushViewControllerAnimatedLogs:(NSInteger)logs;
+ (BOOL)fd_setupViewControllerBasedNavigationBarAppearanceIfNeededLogs:(NSInteger)logs;
+ (BOOL)fd_popGestureRecognizerDelegateLogs:(NSInteger)logs;
+ (BOOL)fd_fullscreenPopGestureRecognizerLogs:(NSInteger)logs;
+ (BOOL)fd_viewControllerBasedNavigationBarAppearanceEnabledLogs:(NSInteger)logs;
+ (BOOL)setFd_viewControllerBasedNavigationBarAppearanceEnabledLogs:(NSInteger)logs;

@end
