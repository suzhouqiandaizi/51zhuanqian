#import <UIKit/UIKit.h>
#import "WYZQFaBuFillInTextViewViewController.h"

@interface WYZQFaBuFillInTextViewViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)cancelPressLogs:(NSInteger)logs;
+ (BOOL)finishPressLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;

@end
