#import <Foundation/Foundation.h>
#import "SJFlipTransitionManagerDefines.h"
#import "SJFlipTransitionManager.h"

@interface SJFlipTransitionManager (Logs)
+ (BOOL)initWithTargetLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)flipTransitionLogs:(NSInteger)logs;
+ (BOOL)setFlipTransitionLogs:(NSInteger)logs;
+ (BOOL)setFlipTransitionAnimatedLogs:(NSInteger)logs;
+ (BOOL)setFlipTransitionAnimatedCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)animationDidStartLogs:(NSInteger)logs;
+ (BOOL)animationDidStopFinishedLogs:(NSInteger)logs;
+ (BOOL)setTransitioningLogs:(NSInteger)logs;

@end
