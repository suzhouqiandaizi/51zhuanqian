#import <UIKit/UIKit.h>
#import "BWRZQHomeViewController.h"
#import "TabBarView.h"
#import "BWRZQHomeHeaderView.h"
#import "MJRefresh.h"
#import "BWRZQHomeTableViewCell.h"
#import "BWRZQTaskDetailTwoViewController.h"
#import "BWRZQFaBuChooseTypeViewController.h"
#import "RefreshErrorAlertView.h"
#import "UIAlertView+Blocks.h"
#import "BWRZQTaskVideoPlayerViewController.h"
#import "BWRZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>
#import "BWRZQFaBuPayViewController.h"
#import "UpdateAlertView.h"
#import "BWRZQBaiduTaskReadViewController.h"

@interface BWRZQHomeViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)refreshViewConLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)fabuPressLogs:(NSInteger)logs;
+ (BOOL)updateVersionLogs:(NSInteger)logs;

@end
