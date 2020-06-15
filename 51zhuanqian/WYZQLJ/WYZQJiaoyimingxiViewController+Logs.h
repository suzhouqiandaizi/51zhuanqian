#import <UIKit/UIKit.h>
#import "WYZQJiaoyimingxiViewController.h"
#import "WYZQJiaoyimingxiTableViewCell.h"
#import "MJRefresh.h"

@interface WYZQJiaoyimingxiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)numberOfSectionsInTableViewLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforheaderinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewHeightforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewViewforheaderinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;

@end
