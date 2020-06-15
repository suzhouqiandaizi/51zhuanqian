#import <UIKit/UIKit.h>
#import "WYZQTaskFabuDetailViewController.h"
#import "GlobalFunction.h"
#import "WYZQFaBuDetailTwoViewController.h"
#import "WYZQTaskFabuDetailProcessViewController.h"
#import "SGPagingView.h"
#import "WYZQFaBuFillInViewController.h"
#import "WYZQTaskFabuResultContentViewController.h"
#import "WYZQFaBuPayViewController.h"
#import "WYZQFaBuFillInTwoViewController.h"

@interface WYZQTaskFabuDetailViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requestConentLogs:(NSInteger)logs;
+ (BOOL)chakanPressLogs:(NSInteger)logs;
+ (BOOL)xiugaiPressLogs:(NSInteger)logs;
+ (BOOL)fukuanPressLogs:(NSInteger)logs;
+ (BOOL)setupPageViewLogs:(NSInteger)logs;
+ (BOOL)pageTitleViewSelectedindexLogs:(NSInteger)logs;
+ (BOOL)pageContentViewProgressOriginalindexTargetindexLogs:(NSInteger)logs;
+ (BOOL)endDeceleratingPageContentViewTargetindexLogs:(NSInteger)logs;

@end
