#import <UIKit/UIKit.h>
#import "BWRZQLoginPasswordViewController.h"
#import "GlobalFunction.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "JPUSHService.h"
#import "BWRZQHomeViewController.h"
#import "SharedViewControllers.h"
#import "LoadConfig.h"

@interface BWRZQLoginPasswordViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldClearLogs:(NSInteger)logs;
+ (BOOL)setLoginBtnClickLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;

@end
