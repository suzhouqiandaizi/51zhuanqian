#import <UIKit/UIKit.h>
#import "SJPlayerGestureControlDefines.h"
#import "SJEdgeControlButtonItem.h"
#import <objc/message.h>

@interface SJEdgeControlButtonItem (Logs)
+ (BOOL)initWithTitleTargetActionTagLogs:(NSInteger)logs;
+ (BOOL)initWithImageTargetActionTagLogs:(NSInteger)logs;
+ (BOOL)initWithCustomViewTagLogs:(NSInteger)logs;
+ (BOOL)initWithTagLogs:(NSInteger)logs;
+ (BOOL)addTargetActionLogs:(NSInteger)logs;
+ (BOOL)performActionLogs:(NSInteger)logs;

@end
