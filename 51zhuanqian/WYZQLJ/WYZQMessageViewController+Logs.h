#import <UIKit/UIKit.h>
#import "WYZQMessageViewController.h"
#import "SGPagingView.h"
#import "WYZQMessageItemViewController.h"

@interface WYZQMessageViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
