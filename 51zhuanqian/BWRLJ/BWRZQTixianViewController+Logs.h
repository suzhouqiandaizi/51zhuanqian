#import <UIKit/UIKit.h>
#import "BWRZQTixianViewController.h"
#import "BWRZQTiXianGuangLiViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "BWRZQInputJiaoyiMimaViewController.h"
#import "BWRZQTixianResultViewController.h"
#import "GlobalFunction.h"
#import "BWRZQTixianSuccessViewController.h"

@interface BWRZQTixianViewController (Logs)
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
