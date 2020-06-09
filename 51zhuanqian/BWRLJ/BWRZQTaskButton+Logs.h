#import <UIKit/UIKit.h>
#import "BWRZQTaskObject.h"
#import "BWRZQTaskButton.h"
#import "GlobalFunction.h"

@interface BWRZQTaskButton (Logs)
+ (BOOL)drawRectLogs:(NSInteger)logs;
+ (BOOL)setTaskButtonLogs:(NSInteger)logs;
+ (BOOL)setTaskButtonTitleWithstatusLogs:(NSInteger)logs;
+ (BOOL)setTaskDoingButtonTitleWithstatusLogs:(NSInteger)logs;

@end
