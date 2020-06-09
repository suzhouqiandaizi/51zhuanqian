#import <UIKit/UIKit.h>
#import "BWRZQMessageItemViewController.h"
#import "MJRefresh.h"
#import "BWRZQMessageTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskFabuViewController.h"
#import "BWRZQTaskDoingViewController.h"

@interface BWRZQMessageItemViewController (Logs)
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
