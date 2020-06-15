#import <UIKit/UIKit.h>
#import "WYZQFriendDetailViewController.h"
#import "WYZQHomeTableViewCell.h"
#import "WYZQFriendDetailHeaderView.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQTaskReadViewController.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>

@interface WYZQFriendDetailViewController (Logs)
+ (BOOL)navigationControllerWillshowviewcontrollerAnimatedLogs:(NSInteger)logs;
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)loadedAllContentLogs:(NSInteger)logs;
+ (BOOL)backExPressLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)scrollViewDidScrollLogs:(NSInteger)logs;

@end
