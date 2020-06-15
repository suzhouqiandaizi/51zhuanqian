#import <UIKit/UIKit.h>
#import "WYZQTaskReadItemViewController.h"
#import "WYZQTaskReadItemOneTableViewCell.h"
#import "WYZQTaskReadItemTwoTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "MJRefresh.h"
#import "WYZQTaskReadViewController.h"

@interface WYZQTaskReadItemViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
