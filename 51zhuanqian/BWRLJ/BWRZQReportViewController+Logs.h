#import <UIKit/UIKit.h>
#import "BWRZQReportViewController.h"
#import "GlobalFunction.h"
#import "BWRZQLoginViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomSuccessAlertView.h"

@interface BWRZQReportViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;
+ (BOOL)sendPressLogs:(NSInteger)logs;

@end
