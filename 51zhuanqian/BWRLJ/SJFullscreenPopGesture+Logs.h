#import <UIKit/UIKit.h>
#import "SJFullscreenPopGesture.h"
#import <objc/message.h>
#import <WebKit/WebKit.h>

@interface SJFullscreenPopGesture (Logs)
+ (BOOL)setGestureTypeLogs:(NSInteger)logs;
+ (BOOL)gestureTypeLogs:(NSInteger)logs;
+ (BOOL)setTransitionModeLogs:(NSInteger)logs;
+ (BOOL)transitionModeLogs:(NSInteger)logs;
+ (BOOL)setMaxOffsetToTriggerPopLogs:(NSInteger)logs;
+ (BOOL)maxOffsetToTriggerPopLogs:(NSInteger)logs;

@end
