#import <UIKit/UIKit.h>
#import "BWRZQTaskDoingItemTableViewCell.h"
#import "BWRZQTaskDoingDetailViewController.h"
#import "BWRZQTaskObject.h"
#import "GlobalFunction.h"
#import "SGPagingView.h"
#import "BWRZQTaskDoingDetailTwoContentViewController.h"
#import "BWRZQTaskDoingDetailProcessViewController.h"
#import "BWRZQTaskButton.h"
#import "BWRZQSubmitTaskViewController.h"
#import "BWRZQAppealViewController.h"

@interface BWRZQTaskDoingDetailViewController (Logs)
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
