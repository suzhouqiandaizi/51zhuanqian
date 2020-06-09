#import <UIKit/UIKit.h>
#import "BWRZQTuiGuangViewController.h"
#import "TabBarView.h"
#import "GlobalFunction.h"
#import "ShareView.h"
#import "BWRZQShouTuDetailViewController.h"
#import "RefreshErrorAlertView.h"
#import "HYHScrollLabel.h"

@interface BWRZQTuiGuangViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)rulePressLogs:(NSInteger)logs;
+ (BOOL)sharePressLogs:(NSInteger)logs;
+ (BOOL)copyPressLogs:(NSInteger)logs;
+ (BOOL)shoutuDetailPressLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidScrollLogs:(NSInteger)logs;
+ (BOOL)drawLineOfDashByImageViewLogs:(NSInteger)logs;

@end
