#import <UIKit/UIKit.h>
#import "UIViewController+WZYForeNotification.h"
#import <objc/runtime.h>

@interface UIViewController (WZYForeNotificationLogs)
+ (BOOL)setWZYForegroundNotificationStatusBarHiddenLogs:(NSInteger)logs;
+ (BOOL)WZYForegroundNotificationStatusBarHiddenLogs:(NSInteger)logs;
+ (BOOL)prefersStatusBarHiddenLogs:(NSInteger)logs;

@end
