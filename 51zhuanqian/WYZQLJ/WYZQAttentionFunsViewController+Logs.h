#import <UIKit/UIKit.h>
#import "WYZQAttentionFunsViewController.h"
#import "SGPagingView.h"
#import "WYZQAttentionFunsDetailViewController.h"

@interface WYZQAttentionFunsViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
