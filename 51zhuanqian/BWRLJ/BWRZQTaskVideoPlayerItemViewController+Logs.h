#import <UIKit/UIKit.h>
#import "BWRZQTaskVideoPlayerItemViewController.h"
#import "RefreshErrorAlertView.h"
#import "MJRefresh.h"
#import "BWRZQHomeTableViewCell.h"
#import "BWRZQTaskVideoPlayerViewController.h"

@interface BWRZQTaskVideoPlayerItemViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
