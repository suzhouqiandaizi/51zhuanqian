#import <UIKit/UIKit.h>
#import "BWRZQMyTaskViewController.h"
#import "MJRefresh.h"
#import "BWRZQHomeTableViewCell.h"
#import "SGPagingView.h"
#import "BWRZQMyTaskItemViewController.h"

@interface BWRZQMyTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)testLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;

@end
