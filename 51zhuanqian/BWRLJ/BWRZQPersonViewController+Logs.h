#import <UIKit/UIKit.h>
#import "BWRZQPersonViewController.h"
#import "TabBarView.h"
#import "BWRZQLoginViewController.h"
#import "SRRefreshView.h"
#import "BWRZQSettingViewController.h"
#import "BWRZQMyTaskViewController.h"
#import "LoadConfig.h"
#import "GlobalFunction.h"
#import "LXGradientProcessView.h"
#import "BWRZQTixianViewController.h"
#import "BWRZQSaleCoinViewController.h"
#import "BWRZQCoinRecordDetailViewController.h"
#import "BWRZQMessageViewController.h"
#import "BWRZQTaskDoingViewController.h"
#import "BWRZQTaskFabuViewController.h"
#import "BWRZQAttentionFunsViewController.h"
#import "BWRZQPersonInfoViewController.h"
#import "BWRZQTixianAgainViewController.h"

@interface BWRZQPersonViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)showContentViewLogs:(NSInteger)logs;
+ (BOOL)hasLoadedAllLogs:(NSInteger)logs;
+ (BOOL)settingPressLogs:(NSInteger)logs;
+ (BOOL)tixianPressLogs:(NSInteger)logs;
+ (BOOL)saleCoinPressLogs:(NSInteger)logs;
+ (BOOL)cashRecordPressLogs:(NSInteger)logs;
+ (BOOL)coinRecordPressLogs:(NSInteger)logs;
+ (BOOL)messagePressLogs:(NSInteger)logs;
+ (BOOL)taskDoingPressLogs:(NSInteger)logs;
+ (BOOL)fabuPressLogs:(NSInteger)logs;
+ (BOOL)tixishuomingPressLogs:(NSInteger)logs;
+ (BOOL)zhanghuPressLogs:(NSInteger)logs;
+ (BOOL)guanzhuPressLogs:(NSInteger)logs;
+ (BOOL)funsPressLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidScrollLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidEndDraggingWilldecelerateLogs:(NSInteger)logs;
+ (BOOL)slimeRefreshStartRefreshLogs:(NSInteger)logs;
+ (BOOL)slimeViewLogs:(NSInteger)logs;

@end
