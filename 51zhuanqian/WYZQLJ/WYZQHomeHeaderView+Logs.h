#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "WYZQHomeHeaderView.h"
#import "AppDelegate.h"
#import "WYZQXinShouViewController.h"
#import "WYZQWebShowViewController.h"
#import "LoadConfig.h"
#import "WYZQHomeTaskOneView.h"
#import "WYZQHomeTaskTwoView.h"
#import "WYZQHomeTaskThreeView.h"
#import "GlobalFunction.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQSingleTaskViewController.h"

@interface WYZQHomeHeaderView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)morePressLogs:(NSInteger)logs;
+ (BOOL)twoBtnPressLogs:(NSInteger)logs;
+ (BOOL)setBannersLogs:(NSInteger)logs;
+ (BOOL)cycleScrollViewDidselectitematindexLogs:(NSInteger)logs;

@end
