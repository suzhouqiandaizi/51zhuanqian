#import <UIKit/UIKit.h>
#import "WYZQPersonViewController.h"
#import "TabBarView.h"
#import "WYZQLoginViewController.h"
#import "SRRefreshView.h"
#import "WYZQSettingViewController.h"
#import "WYZQMyTaskViewController.h"
#import "LoadConfig.h"
#import "GlobalFunction.h"
#import "LXGradientProcessView.h"
#import "WYZQTixianViewController.h"
#import "WYZQSaleCoinViewController.h"
#import "WYZQCoinRecordDetailViewController.h"
#import "WYZQMessageViewController.h"
#import "WYZQTaskDoingViewController.h"
#import "WYZQTaskFabuViewController.h"
#import "WYZQAttentionFunsViewController.h"
#import "WYZQPersonInfoViewController.h"
#import "WYZQTixianAgainViewController.h"

@interface WYZQPersonViewController (Logs)
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
