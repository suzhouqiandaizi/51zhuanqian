#import <UIKit/UIKit.h>
#import "BWRZQSubmitAlertView.h"

@interface BWRZQSubmitAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)neverShowPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;

@end
