#import <UIKit/UIKit.h>
#import "WYZQTaskDoingViewController.h"
#import "SGPagingView.h"
#import "WYZQTaskDoingItemViewController.h"

@interface WYZQTaskDoingViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)testLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
