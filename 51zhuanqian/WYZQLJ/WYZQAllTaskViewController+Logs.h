#import <UIKit/UIKit.h>
#import "WYZQAllTaskViewController.h"
#import "SGPagingView.h"
#import "WYZQTaskItemViewController.h"
#import "LoadConfig.h"

@interface WYZQAllTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
