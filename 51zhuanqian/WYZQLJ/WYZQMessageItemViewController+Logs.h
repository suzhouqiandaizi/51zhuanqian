#import <UIKit/UIKit.h>
#import "WYZQMessageItemViewController.h"
#import "MJRefresh.h"
#import "WYZQMessageTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskFabuViewController.h"
#import "WYZQTaskDoingViewController.h"

@interface WYZQMessageItemViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)addShadowToViewShadowopacityShadowradiusCornerradiusLogs:(NSInteger)logs;

@end
