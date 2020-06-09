#import <UIKit/UIKit.h>
#import "BWRZQTaskFabuResultViewController.h"
#import "BWRZQTaskFabuResultTableViewCell.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "MIPhotoBrowser.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "CustomTextViewAlertView.h"

@interface BWRZQTaskFabuResultViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)laheiPressLogs:(NSInteger)logs;
+ (BOOL)tongguoPressLogs:(NSInteger)logs;
+ (BOOL)jujuePressLogs:(NSInteger)logs;
+ (BOOL)showReasonPressLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)getStatusStrLogs:(NSInteger)logs;

@end
