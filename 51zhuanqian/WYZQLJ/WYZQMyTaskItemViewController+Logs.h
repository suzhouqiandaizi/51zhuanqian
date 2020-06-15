#import <UIKit/UIKit.h>
#import "WYZQMyTaskItemViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"

@interface WYZQMyTaskItemViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
