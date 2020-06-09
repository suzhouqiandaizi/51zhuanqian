#import <UIKit/UIKit.h>
#import "BWRZQTaskFabuItemTableViewCell.h"
#import "BWRZQTaskFabuItemViewController.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQFaBuPayViewController.h"
#import "BWRZQFaBuDetailTwoViewController.h"
#import "BWRZQTaskFabuDetailViewController.h"
#import "BWRZQFaBuFillInViewController.h"
#import "BWRZQFaBuFillInTwoViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"

@interface BWRZQTaskFabuItemViewController (Logs)
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
