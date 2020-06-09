#import "SJEdgeControlLayerAdapters.h"
#import "SJControlLayerDefines.h"
#import "SJFloatSmallViewControlLayer.h"
#import "UIView+SJAnimationAdded.h"
#import "SJFloatSmallViewControlLayerResourceLoader.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h" 

@interface SJFloatSmallViewControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)hitTestWitheventLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)tappedCloseItemLogs:(NSInteger)logs;
+ (BOOL)_setupViewLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs;

@end
