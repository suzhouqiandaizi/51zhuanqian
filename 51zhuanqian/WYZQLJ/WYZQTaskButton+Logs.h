#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
#import "WYZQTaskButton.h"
#import "GlobalFunction.h"

@interface WYZQTaskButton (Logs)
+ (BOOL)drawRectLogs:(NSInteger)logs;
+ (BOOL)setTaskButtonLogs:(NSInteger)logs;
+ (BOOL)setTaskButtonTitleWithstatusLogs:(NSInteger)logs;
+ (BOOL)setTaskDoingButtonTitleWithstatusLogs:(NSInteger)logs;

@end
