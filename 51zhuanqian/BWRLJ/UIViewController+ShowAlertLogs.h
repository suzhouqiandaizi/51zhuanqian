#import <UIKit/UIKit.h>
#import "UIViewController+ShowAlert.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

@interface UIViewController (ShowAlertLogs)
+ (BOOL)HUDLogs:(NSInteger)logs;
+ (BOOL)setHUDLogs:(NSInteger)logs;
+ (BOOL)showHUDAlertLogs:(NSInteger)logs;
+ (BOOL)loadingHUDAlertLogs:(NSInteger)logs;
+ (BOOL)loadingHUDAlertWithviewLogs:(NSInteger)logs;
+ (BOOL)hideHudAlertLogs:(NSInteger)logs;
+ (BOOL)loadingHUDAlertToWindowLogs:(NSInteger)logs;

@end
