#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"
#import <objc/runtime.h>

@interface UIViewController (FDFullscreenPopGestureLogs)
+ (BOOL)fd_interactivePopDisabledLogs:(NSInteger)logs;
+ (BOOL)setFd_interactivePopDisabledLogs:(NSInteger)logs;
+ (BOOL)fd_prefersNavigationBarHiddenLogs:(NSInteger)logs;
+ (BOOL)setFd_prefersNavigationBarHiddenLogs:(NSInteger)logs;
+ (BOOL)fd_interactivePopMaxAllowedInitialDistanceToLeftEdgeLogs:(NSInteger)logs;
+ (BOOL)setFd_interactivePopMaxAllowedInitialDistanceToLeftEdgeLogs:(NSInteger)logs;

@end
