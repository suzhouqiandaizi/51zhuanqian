#import <UIKit/UIKit.h>
#import "SJBaseProtocols.h"
#import "SJBaseViewController.h"
#import "NSObject+SJObserverHelper.h"
#import "SJAppearStateObserver.h"
#import "SJStatusBarManager.h"

@interface SJBaseViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)_sj_base_setupViewsLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)viewDidDisappearLogs:(NSInteger)logs;
+ (BOOL)prefersStatusBarHiddenLogs:(NSInteger)logs;
+ (BOOL)preferredStatusBarStyleLogs:(NSInteger)logs;
+ (BOOL)prefersHomeIndicatorAutoHiddenLogs:(NSInteger)logs;
+ (BOOL)_base_showOrHiddenNavigationBarIfNeededLogs:(NSInteger)logs;
+ (BOOL)_base_invokeOnceMethodsIfNeededLogs:(NSInteger)logs;
+ (BOOL)setAppearStateLogs:(NSInteger)logs;

@end
