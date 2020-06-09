#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "BWRZQHomeHeaderView.h"
#import "AppDelegate.h"
#import "BWRZQXinShouViewController.h"
#import "BWRZQWebShowViewController.h"
#import "LoadConfig.h"
#import "BWRZQHomeTaskOneView.h"
#import "BWRZQHomeTaskTwoView.h"
#import "BWRZQHomeTaskThreeView.h"
#import "GlobalFunction.h"
#import "BWRZQTaskDetailTwoViewController.h"
#import "BWRZQSingleTaskViewController.h"

@interface BWRZQHomeHeaderView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)morePressLogs:(NSInteger)logs;
+ (BOOL)twoBtnPressLogs:(NSInteger)logs;
+ (BOOL)setBannersLogs:(NSInteger)logs;
+ (BOOL)cycleScrollViewDidselectitematindexLogs:(NSInteger)logs;

@end
