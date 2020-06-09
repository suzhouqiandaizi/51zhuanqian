#import <UIKit/UIKit.h>
#import "BWRZQSingleTaskViewController.h"
#import "MJRefresh.h"
#import "BWRZQHomeTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskDetailTwoViewController.h"
#import "BWRZQTaskVideoPlayerViewController.h"
#import "BWRZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import "BWRZQTaskClassifyView.h"
#import <DyAdSdk/DyAdApi.h>

@interface BWRZQSingleTaskViewController (Logs)
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
