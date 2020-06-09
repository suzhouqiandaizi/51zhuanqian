#import <UIKit/UIKit.h>
#import "WZYLabel.h"
#import "AppDelegate.h"

@interface WZYLabel (Logs)
+ (BOOL)setShouldGestureRecognizerLogs:(NSInteger)logs;
+ (BOOL)longPressGestureRecognizedLogs:(NSInteger)logs;
+ (BOOL)canBecomeFirstResponderLogs:(NSInteger)logs;
+ (BOOL)canPerformActionWithsenderLogs:(NSInteger)logs;
+ (BOOL)cutLogs:(NSInteger)logs;
+ (BOOL)copyLogs:(NSInteger)logs;
+ (BOOL)pasteLogs:(NSInteger)logs;
+ (BOOL)yaoqingLogs:(NSInteger)logs;
+ (BOOL)shareLogs:(NSInteger)logs;

@end
