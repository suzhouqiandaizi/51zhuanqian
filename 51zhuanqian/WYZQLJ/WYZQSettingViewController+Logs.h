#import <UIKit/UIKit.h>
#import "WYZQSettingViewController.h"
#import "CustomInfoAlertView.h"
#import "CustomIOSAlertView.h"
#import "WYZQAboutViewController.h"
#import "WYZQFeedBackViewController.h"
#import "WYZQBlacklistViewController.h"
#import "UIAlertView+Blocks.h"
#import <StoreKit/StoreKit.h>
#import "UpdateAlertView.h"
#import "WYZQLoginViewController.h"
#import "SharedViewControllers.h"
#import "WYZQHomeViewController.h"

@interface WYZQSettingViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)logoutPressLogs:(NSInteger)logs;
+ (BOOL)cleanPressLogs:(NSInteger)logs;
+ (BOOL)feedbackPressLogs:(NSInteger)logs;
+ (BOOL)aboutPressLogs:(NSInteger)logs;
+ (BOOL)questionsPressLogs:(NSInteger)logs;
+ (BOOL)heimingdanPressLogs:(NSInteger)logs;
+ (BOOL)updatePressLogs:(NSInteger)logs;
+ (BOOL)haopingPressLogs:(NSInteger)logs;

@end
