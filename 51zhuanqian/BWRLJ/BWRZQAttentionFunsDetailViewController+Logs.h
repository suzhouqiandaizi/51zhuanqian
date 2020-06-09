#import <UIKit/UIKit.h>
#import "BWRZQAttentionFunsDetailViewController.h"
#import "MJRefresh.h"
#import "BWRZQAttentionFunsTableViewCell.h"
#import "BWRZQFriendDetailViewController.h"
#import "RefreshErrorAlertView.h"

@interface BWRZQAttentionFunsDetailViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
