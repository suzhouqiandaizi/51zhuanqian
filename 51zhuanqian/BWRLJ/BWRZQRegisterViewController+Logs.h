#import <UIKit/UIKit.h>
#import "BWRZQRegisterViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomSuccessAlertView.h"
#import "BWRZQLoginViewController.h"
#import "AppDelegate.h"
#import "SharedViewControllers.h"
#import "BWRZQPersonViewController.h"

@interface BWRZQRegisterViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)codePressLogs:(NSInteger)logs;
+ (BOOL)getPhoneCodeLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)nextActionLogs:(NSInteger)logs;
+ (BOOL)updateTimeLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldClearLogs:(NSInteger)logs;
+ (BOOL)setVerificationCodeBtnClickLogs:(NSInteger)logs;
+ (BOOL)showServerProtocolPressLogs:(NSInteger)logs;

@end
