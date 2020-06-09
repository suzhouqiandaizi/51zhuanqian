#import <UIKit/UIKit.h>
#import "BWRZQSettingViewController.h"
#import "CustomInfoAlertView.h"
#import "CustomIOSAlertView.h"
#import "BWRZQAboutViewController.h"
#import "BWRZQFeedBackViewController.h"
#import "BWRZQBlacklistViewController.h"
#import "UIAlertView+Blocks.h"
#import <StoreKit/StoreKit.h>
#import "UpdateAlertView.h"
#import "BWRZQLoginViewController.h"
#import "SharedViewControllers.h"
#import "BWRZQHomeViewController.h"

@interface BWRZQSettingViewController (Logs)
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
