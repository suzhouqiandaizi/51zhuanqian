#import <UIKit/UIKit.h>
#import "BWRZQShouTuDetailViewController.h"
#import "BWRZQShouTuDetailTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "MJRefresh.h"

@interface BWRZQShouTuDetailViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
