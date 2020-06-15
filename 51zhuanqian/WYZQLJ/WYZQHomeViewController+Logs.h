#import <UIKit/UIKit.h>
#import "WYZQHomeViewController.h"
#import "TabBarView.h"
#import "WYZQHomeHeaderView.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQFaBuChooseTypeViewController.h"
#import "RefreshErrorAlertView.h"
#import "UIAlertView+Blocks.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import "WYZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>
#import "WYZQFaBuPayViewController.h"
#import "UpdateAlertView.h"
#import "WYZQBaiduTaskReadViewController.h"

@interface WYZQHomeViewController (Logs)
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
