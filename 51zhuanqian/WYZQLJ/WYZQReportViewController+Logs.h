#import <UIKit/UIKit.h>
#import "WYZQReportViewController.h"
#import "GlobalFunction.h"
#import "WYZQLoginViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomSuccessAlertView.h"

@interface WYZQReportViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;
+ (BOOL)sendPressLogs:(NSInteger)logs;

@end
