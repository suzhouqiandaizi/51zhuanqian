#import <UIKit/UIKit.h>
#import "WYZQCoinRecordViewController.h"
#import "WYZQCoinRecordDetailViewController.h"
#import "SGPagingView.h"

@interface WYZQCoinRecordDetailViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
