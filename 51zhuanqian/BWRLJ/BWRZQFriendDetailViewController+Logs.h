#import <UIKit/UIKit.h>
#import "BWRZQFriendDetailViewController.h"
#import "BWRZQHomeTableViewCell.h"
#import "BWRZQFriendDetailHeaderView.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskDetailTwoViewController.h"
#import "BWRZQTaskReadViewController.h"
#import "BWRZQTaskVideoPlayerViewController.h"
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>

@interface BWRZQFriendDetailViewController (Logs)
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
