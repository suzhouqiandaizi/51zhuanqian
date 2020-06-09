#import <UIKit/UIKit.h>
#import "TabBarView.h"
#import "AppDelegate.h"
#import "SharedViewControllers.h"
#import "BWRZQHomeViewController.h"
#import "BWRZQTuiGuangViewController.h"
#import "BWRZQPersonViewController.h"
#import "BWRZQLoginViewController.h"
#import "LoadConfig.h"

@interface TabBarView (Logs)
+ (BOOL)sharedTabBarViewLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)setCurrentViewControllerIndexLogs:(NSInteger)logs;
+ (BOOL)doBtnOneLogs:(NSInteger)logs;
+ (BOOL)doBtnThreeLogs:(NSInteger)logs;
+ (BOOL)doBtnFourLogs:(NSInteger)logs;
+ (BOOL)loginPressLogs:(NSInteger)logs;

@end
