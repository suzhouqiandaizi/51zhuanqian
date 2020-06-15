#import <UIKit/UIKit.h>
#import "WYZQTixianAgainViewController.h"
#import "WYZQTiXianGuangLiViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "WYZQInputJiaoyiMimaViewController.h"
#import "WYZQTixianResultViewController.h"
#import "GlobalFunction.h"
#import "WYZQTixianSuccessViewController.h"
#import "WYZQTixianViewController.h"

@interface WYZQTixianAgainViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)selectSortLogs:(NSInteger)logs;
+ (BOOL)tixianguanliPressLogs:(NSInteger)logs;
+ (BOOL)editPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;

@end
