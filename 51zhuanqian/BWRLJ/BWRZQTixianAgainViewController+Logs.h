#import <UIKit/UIKit.h>
#import "BWRZQTixianAgainViewController.h"
#import "BWRZQTiXianGuangLiViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "BWRZQInputJiaoyiMimaViewController.h"
#import "BWRZQTixianResultViewController.h"
#import "GlobalFunction.h"
#import "BWRZQTixianSuccessViewController.h"
#import "BWRZQTixianViewController.h"

@interface BWRZQTixianAgainViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)selectSortLogs:(NSInteger)logs;
+ (BOOL)tixianguanliPressLogs:(NSInteger)logs;
+ (BOOL)editPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs;

@end
