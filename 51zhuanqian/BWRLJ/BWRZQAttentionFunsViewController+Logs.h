#import <UIKit/UIKit.h>
#import "BWRZQAttentionFunsViewController.h"
#import "SGPagingView.h"
#import "BWRZQAttentionFunsDetailViewController.h"

@interface BWRZQAttentionFunsViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
