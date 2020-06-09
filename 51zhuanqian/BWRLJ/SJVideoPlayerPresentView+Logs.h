#import <UIKit/UIKit.h>
#import "SJVideoPlayerPresentViewDefines.h"
#import "SJPlayerGestureControlDefines.h"
#import "SJVideoPlayerPresentView.h"
#import "SJBaseVideoPlayerConst.h"

@interface SJVideoPlayerPresentView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)willMoveToWindowLogs:(NSInteger)logs;
+ (BOOL)handleSingleTapLogs:(NSInteger)logs;
+ (BOOL)handleDoubleTapLogs:(NSInteger)logs;
+ (BOOL)handlePanLogs:(NSInteger)logs;
+ (BOOL)handlePinchLogs:(NSInteger)logs;
+ (BOOL)showPlaceholderAnimatedLogs:(NSInteger)logs;
+ (BOOL)hiddenPlaceholderAnimatedLogs:(NSInteger)logs;
+ (BOOL)hiddenPlaceholderAnimatedDelayLogs:(NSInteger)logs;
+ (BOOL)_hiddenPlaceholderAnimatedLogs:(NSInteger)logs;
+ (BOOL)cancelGestureLogs:(NSInteger)logs;
+ (BOOL)stateOfGestureLogs:(NSInteger)logs;
+ (BOOL)_setupViewsLogs:(NSInteger)logs;
+ (BOOL)placeholderImageViewLogs:(NSInteger)logs;
+ (BOOL)isPlaceholderImageViewHiddenLogs:(NSInteger)logs;
+ (BOOL)gestureRecognizerShouldBeginLogs:(NSInteger)logs;
+ (BOOL)gestureRecognizerShouldrecognizesimultaneouslywithgesturerecognizerLogs:(NSInteger)logs;
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs;
+ (BOOL)touchesEndedWitheventLogs:(NSInteger)logs;
+ (BOOL)_recognizeLogs:(NSInteger)logs;
+ (BOOL)_isSupporedGestureTypeLogs:(NSInteger)logs;

@end
