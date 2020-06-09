#import "SJEdgeControlLayerAdapters.h"
#import "SJControlLayerDefines.h"
#import "SJVideoPlayerURLAsset+SJExtendedDefinition.h"
#import "SJSwitchVideoDefinitionControlLayer.h"
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import "UIView+SJAnimationAdded.h"

@interface SJSwitchVideoDefinitionControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)_clickedItemLogs:(NSInteger)logs;
+ (BOOL)selectedTextColorLogs:(NSInteger)logs;
+ (BOOL)setAssetsLogs:(NSInteger)logs;
+ (BOOL)_refreshItemsLogs:(NSInteger)logs;

@end
