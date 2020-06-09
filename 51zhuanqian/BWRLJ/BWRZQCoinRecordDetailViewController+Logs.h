#import <UIKit/UIKit.h>
#import "BWRZQCoinRecordViewController.h"
#import "BWRZQCoinRecordDetailViewController.h"
#import "SGPagingView.h"

@interface BWRZQCoinRecordDetailViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
