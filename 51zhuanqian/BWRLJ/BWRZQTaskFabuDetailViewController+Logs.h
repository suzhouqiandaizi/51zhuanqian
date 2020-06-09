#import <UIKit/UIKit.h>
#import "BWRZQTaskFabuDetailViewController.h"
#import "GlobalFunction.h"
#import "BWRZQFaBuDetailTwoViewController.h"
#import "BWRZQTaskFabuDetailProcessViewController.h"
#import "SGPagingView.h"
#import "BWRZQFaBuFillInViewController.h"
#import "BWRZQTaskFabuResultContentViewController.h"
#import "BWRZQFaBuPayViewController.h"
#import "BWRZQFaBuFillInTwoViewController.h"

@interface BWRZQTaskFabuDetailViewController (Logs)
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
