#import <UIKit/UIKit.h>
#import "WYZQMyTaskViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "SGPagingView.h"
#import "WYZQMyTaskItemViewController.h"

@interface WYZQMyTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)testLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;

@end
