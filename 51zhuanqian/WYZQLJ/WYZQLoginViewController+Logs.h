#import <UIKit/UIKit.h>
#import "WYZQLoginViewController.h"
#import "JPUSHService.h"
#import "SharedViewControllers.h"
#import "GlobalFunction.h"
#import "WYZQHomeViewController.h"
#import "WYZQLoginAlertView.h"
#import "WYZQLoginPrivacyProtocolView.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "LoadConfig.h"
#import "WYZQLoginPasswordViewController.h"
#import <TJSDK/TJSDK.h>

@interface WYZQLoginViewController (Logs)
+ (BOOL)navigationControllerWillshowviewcontrollerAnimatedLogs:(NSInteger)logs;
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)loginPressLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldClearLogs:(NSInteger)logs;
+ (BOOL)setLoginBtnClickLogs:(NSInteger)logs;
+ (BOOL)codePressLogs:(NSInteger)logs;
+ (BOOL)updateTimeLogs:(NSInteger)logs;
+ (BOOL)yonghuxieyiPressLogs:(NSInteger)logs;
+ (BOOL)meishoudaoyanzhengmaPressLogs:(NSInteger)logs;
+ (BOOL)qiehuanPressLogs:(NSInteger)logs;
+ (BOOL)qiehuanGestureLogs:(NSInteger)logs;

@end
