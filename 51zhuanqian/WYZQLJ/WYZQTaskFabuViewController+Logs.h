#import <UIKit/UIKit.h>
#import "WYZQTaskFabuViewController.h"
#import "SGPagingView.h"
#import "WYZQTaskFabuItemViewController.h"

@interface WYZQTaskFabuViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
