#import <Foundation/Foundation.h>
#import "SJFitOnScreenManagerDefines.h"
#import "SJViewControllerManagerDefines.h"
#import "SJFitOnScreenManager.h"
#import "UIViewController+SJBaseVideoPlayerExtended.h"

@interface SJFitOnScreenManager (Logs)
+ (BOOL)initWithTargetTargetsuperviewLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)isFitOnScreenLogs:(NSInteger)logs;
+ (BOOL)setFitOnScreenLogs:(NSInteger)logs;
+ (BOOL)setFitOnScreenAnimatedLogs:(NSInteger)logs;
+ (BOOL)setFitOnScreenAnimatedCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)setInnerFitOnScreenLogs:(NSInteger)logs;
+ (BOOL)setTransitioningLogs:(NSInteger)logs;
+ (BOOL)setViewControllerManagerLogs:(NSInteger)logs;
+ (BOOL)viewControllerManagerLogs:(NSInteger)logs;
+ (BOOL)viewControllerLogs:(NSInteger)logs;

@end
