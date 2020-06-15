#import <UIKit/UIKit.h>
#import "WYZQTaskFabuItemTableViewCell.h"
#import "WYZQTaskFabuItemViewController.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "WYZQFaBuPayViewController.h"
#import "WYZQFaBuDetailTwoViewController.h"
#import "WYZQTaskFabuDetailViewController.h"
#import "WYZQFaBuFillInViewController.h"
#import "WYZQFaBuFillInTwoViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"

@interface WYZQTaskFabuItemViewController (Logs)
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
