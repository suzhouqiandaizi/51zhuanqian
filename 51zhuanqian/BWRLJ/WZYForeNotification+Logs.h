#import <Foundation/Foundation.h>
#import "WZYForeNotification.h"
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
#import "WZYBannerView.h"
#import "UIViewController+WZYForeNotification.h"

@interface WZYForeNotification (Logs)
+ (BOOL)handleRemoteNotificationSoundidLogs:(NSInteger)logs;
+ (BOOL)handleRemoteNotificationCustomsoundLogs:(NSInteger)logs;
+ (BOOL)showBannerWithUserInfoSoundidLogs:(NSInteger)logs;
+ (BOOL)appRootViewControllerLogs:(NSInteger)logs;
+ (BOOL)deletWZYannerLogs:(NSInteger)logs;

@end
