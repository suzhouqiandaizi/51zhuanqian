#import <UIKit/UIKit.h>
#import "BWRZQTaskDetailTwoAlertView.h"
#import "GlobalFunction.h"

@interface BWRZQTaskDetailTwoAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)neverShowPressLogs:(NSInteger)logs;

@end
