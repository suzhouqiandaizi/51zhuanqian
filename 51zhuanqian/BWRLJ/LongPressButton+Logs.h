#import <UIKit/UIKit.h>
#import "LongPressButton.h"

@interface LongPressButton (Logs)
+ (BOOL)stopLogs:(NSInteger)logs;
+ (BOOL)setPressingTouchendInvokeintervalLogs:(NSInteger)logs;
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs;
+ (BOOL)timesGoByLogs:(NSInteger)logs;
+ (BOOL)touchesCancelledWitheventLogs:(NSInteger)logs;
+ (BOOL)touchesEndedWitheventLogs:(NSInteger)logs;

@end
