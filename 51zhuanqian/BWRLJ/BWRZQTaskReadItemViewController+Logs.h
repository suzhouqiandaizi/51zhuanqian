#import <UIKit/UIKit.h>
#import "BWRZQTaskReadItemViewController.h"
#import "BWRZQTaskReadItemOneTableViewCell.h"
#import "BWRZQTaskReadItemTwoTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "MJRefresh.h"
#import "BWRZQTaskReadViewController.h"

@interface BWRZQTaskReadItemViewController (Logs)
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
