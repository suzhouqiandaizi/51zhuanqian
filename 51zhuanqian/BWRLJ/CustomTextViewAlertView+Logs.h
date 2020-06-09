#import <UIKit/UIKit.h>
#import "CustomTextViewAlertView.h"

@interface CustomTextViewAlertView (Logs)
+ (BOOL)initItemTitleLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;

@end
