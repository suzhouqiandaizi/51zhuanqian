#import <UIKit/UIKit.h>
#import "WYZQCoinRecordViewController.h"
#import "WYZQCoinRecordTableViewCell.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"

@interface WYZQCoinRecordViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)numberOfSectionsInTableViewLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforheaderinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforfooterinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewViewforheaderinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
