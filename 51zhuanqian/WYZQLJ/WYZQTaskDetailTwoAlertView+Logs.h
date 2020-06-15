#import <UIKit/UIKit.h>
#import "WYZQTaskDetailTwoAlertView.h"
#import "GlobalFunction.h"

@interface WYZQTaskDetailTwoAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)neverShowPressLogs:(NSInteger)logs;

@end
