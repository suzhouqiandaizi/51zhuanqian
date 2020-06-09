#import <UIKit/UIKit.h>
#import "BWRZQAllTaskViewController.h"
#import "SGPagingView.h"
#import "BWRZQTaskItemViewController.h"
#import "LoadConfig.h"

@interface BWRZQAllTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
