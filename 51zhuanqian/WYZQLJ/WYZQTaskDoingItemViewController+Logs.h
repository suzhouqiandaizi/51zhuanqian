#import <UIKit/UIKit.h>
#import "WYZQTaskDoingItemTableViewCell.h"
#import "WYZQTaskDoingItemViewController.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDoingDetailViewController.h"
#import "WYZQSubmitTaskViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"

@interface WYZQTaskDoingItemViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)getStatusStrLogs:(NSInteger)logs;

@end
