#import <UIKit/UIKit.h>
#import "WYZQTaskDoingItemTableViewCell.h"
#import "WYZQTaskDoingDetailViewController.h"
#import "WYZQTaskObject.h"
#import "GlobalFunction.h"
#import "SGPagingView.h"
#import "WYZQTaskDoingDetailTwoContentViewController.h"
#import "WYZQTaskDoingDetailProcessViewController.h"
#import "WYZQTaskButton.h"
#import "WYZQSubmitTaskViewController.h"
#import "WYZQAppealViewController.h"

@interface WYZQTaskDoingDetailViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)shensuPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
