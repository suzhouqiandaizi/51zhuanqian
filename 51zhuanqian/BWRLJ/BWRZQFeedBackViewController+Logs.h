#import <UIKit/UIKit.h>
#import "BWRZQFeedBackViewController.h"
#import "GlobalFunction.h"
#import "BWRZQLoginViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomSuccessAlertView.h"

@interface BWRZQFeedBackViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)didReceiveMemoryWarningLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;
+ (BOOL)sendPressLogs:(NSInteger)logs;

@end
