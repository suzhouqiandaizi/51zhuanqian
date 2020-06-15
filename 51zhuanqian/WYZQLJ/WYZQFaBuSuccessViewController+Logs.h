#import <UIKit/UIKit.h>
#import "WYZQFaBuSuccessViewController.h"
#import "GlobalFunction.h"
#import "SharedViewControllers.h"
#import "WYZQHomeViewController.h"
#import "WYZQFaBuDetailTwoViewController.h"

@interface WYZQFaBuSuccessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)addCustomBackBtnLogs:(NSInteger)logs;
+ (BOOL)goCustomBackActionLogs:(NSInteger)logs;
+ (BOOL)customBackPressLogs:(NSInteger)logs;
+ (BOOL)showPressLogs:(NSInteger)logs;

@end
