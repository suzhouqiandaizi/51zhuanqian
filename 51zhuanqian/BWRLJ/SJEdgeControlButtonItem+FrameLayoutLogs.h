#import <UIKit/UIKit.h>
#import "SJPlayerGestureControlDefines.h"
#import "SJEdgeControlButtonItem.h"
#import <objc/message.h>

@interface SJEdgeControlButtonItem (FrameLayoutLogs)
+ (BOOL)frameLayoutWithCustomViewTagLogs:(NSInteger)logs;
+ (BOOL)isFrameLayoutLogs:(NSInteger)logs;

@end
