#import <UIKit/UIKit.h>
#import "WYZQLoginPasswordViewController.h"
#import "GlobalFunction.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "JPUSHService.h"
#import "WYZQHomeViewController.h"
#import "SharedViewControllers.h"
#import "LoadConfig.h"

@interface WYZQLoginPasswordViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldClearLogs:(NSInteger)logs;
+ (BOOL)setLoginBtnClickLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;

@end
