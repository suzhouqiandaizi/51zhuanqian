#import <UIKit/UIKit.h>
#import "BWRZQTaskFabuViewController.h"
#import "SGPagingView.h"
#import "BWRZQTaskFabuItemViewController.h"

@interface BWRZQTaskFabuViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
