#import <UIKit/UIKit.h>
#import "WYZQSubmitAlertView.h"

@interface WYZQSubmitAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)neverShowPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;

@end
