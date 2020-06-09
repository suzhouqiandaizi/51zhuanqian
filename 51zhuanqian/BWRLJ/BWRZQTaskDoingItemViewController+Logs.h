#import <UIKit/UIKit.h>
#import "BWRZQTaskDoingItemTableViewCell.h"
#import "BWRZQTaskDoingItemViewController.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskDoingDetailViewController.h"
#import "BWRZQSubmitTaskViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"

@interface BWRZQTaskDoingItemViewController (Logs)
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
