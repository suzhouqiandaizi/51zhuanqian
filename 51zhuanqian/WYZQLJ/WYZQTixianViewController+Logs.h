#import <UIKit/UIKit.h>
#import "WYZQTixianViewController.h"
#import "WYZQTiXianGuangLiViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "WYZQInputJiaoyiMimaViewController.h"
#import "WYZQTixianResultViewController.h"
#import "GlobalFunction.h"
#import "WYZQTixianSuccessViewController.h"

@interface WYZQTixianViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)tishiPressLogs:(NSInteger)logs;
+ (BOOL)selectSortLogs:(NSInteger)logs;
+ (BOOL)tixianguanliPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)codePressLogs:(NSInteger)logs;
+ (BOOL)updateTimeLogs:(NSInteger)logs;
+ (BOOL)changePressLogs:(NSInteger)logs;
+ (BOOL)actionSheetClickedbuttonatindexLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;

@end
