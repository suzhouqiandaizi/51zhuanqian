#import <UIKit/UIKit.h>
#import "WZYBannerView.h"
#import "WZYForeNotification.h"
#import "UIViewController+WZYForeNotification.h"
#import "UIImage+ColorAtPoint.h"

@interface WZYBannerView (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)setUserInfoLogs:(NSInteger)logs;
+ (BOOL)statusBarOrientationChangeLogs:(NSInteger)logs;
+ (BOOL)addGestureRecognizerLogs:(NSInteger)logs;
+ (BOOL)tapGestureLogs:(NSInteger)logs;
+ (BOOL)swipeGestureLogs:(NSInteger)logs;
+ (BOOL)apperWithAnimationLogs:(NSInteger)logs;
+ (BOOL)removeWithAnimationLogs:(NSInteger)logs;
+ (BOOL)appRootViewControllerLogs:(NSInteger)logs;

@end
