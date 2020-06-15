#import <UIKit/UIKit.h>
#import "WYZQSingleTaskViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import "WYZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import "WYZQTaskClassifyView.h"
#import <DyAdSdk/DyAdApi.h>

@interface WYZQSingleTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)onePressLogs:(NSInteger)logs;
+ (BOOL)twoPressLogs:(NSInteger)logs;
+ (BOOL)removeTaskClassifyViewLogs:(NSInteger)logs;
+ (BOOL)chooseTaskClassifyViewWithsortWithsortvalueLogs:(NSInteger)logs;

@end
