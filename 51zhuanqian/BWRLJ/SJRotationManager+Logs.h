#import <Foundation/Foundation.h>
#import "SJRotationManagerDefines.h"
#import "SJViewControllerManagerDefines.h"
#import "SJRotationManager.h"
#import "SJTimerControl.h"
#import "UIView+SJBaseVideoPlayerExtended.h"
#import <SJUIKit/SJRunLoopTaskQueue.h>
#import "SJRunLoopTaskQueue.h"

@interface SJRotationManager (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)_observeNotifiesLogs:(NSInteger)logs;
+ (BOOL)deviceOrientationDidChangeLogs:(NSInteger)logs;
+ (BOOL)enterBackgroundLogs:(NSInteger)logs;
+ (BOOL)enterForegroundLogs:(NSInteger)logs;
+ (BOOL)isFullscreenLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)rotateLogs:(NSInteger)logs;
+ (BOOL)rotateAnimatedLogs:(NSInteger)logs;
+ (BOOL)rotateAnimatedCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)targetOriginFrameLogs:(NSInteger)logs;
+ (BOOL)prefersStatusBarHiddenLogs:(NSInteger)logs;
+ (BOOL)preferredStatusBarStyleLogs:(NSInteger)logs;
+ (BOOL)vc_forwardPushViewControllerAnimatedLogs:(NSInteger)logs;
+ (BOOL)shouldAutorotateToOrientationLogs:(NSInteger)logs;
+ (BOOL)fullscreenModeViewControllerWillrotatetoorientationLogs:(NSInteger)logs;
+ (BOOL)fullscreenModeViewControllerDidrotatefromorientationLogs:(NSInteger)logs;
+ (BOOL)_beginTransitionLogs:(NSInteger)logs;
+ (BOOL)_finishTransitionLogs:(NSInteger)logs;
+ (BOOL)_isSupportedLogs:(NSInteger)logs;
+ (BOOL)setTransitioningLogs:(NSInteger)logs;
+ (BOOL)timerControlLogs:(NSInteger)logs;

@end
