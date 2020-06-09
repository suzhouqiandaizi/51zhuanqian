#import "SJEdgeControlLayerAdapters.h"
#import "SJControlLayerDefines.h"
#import "SJMoreSettingControlLayer.h"
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import "UIView+SJAnimationAdded.h"
#import "SJButtonProgressSlider.h"
#import "UIView+SJVideoPlayerSetting.h"

@interface SJMoreSettingControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)videoPlayerVolumechangedLogs:(NSInteger)logs;
+ (BOOL)videoPlayerBrightnesschangedLogs:(NSInteger)logs;
+ (BOOL)videoPlayerRatechangedLogs:(NSInteger)logs;
+ (BOOL)sliderWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)sliderValuedidchangeLogs:(NSInteger)logs;
+ (BOOL)sliderDidEndDraggingLogs:(NSInteger)logs;
+ (BOOL)_setupViewLogs:(NSInteger)logs;
+ (BOOL)_refreshValueForSliderItemsLogs:(NSInteger)logs;
+ (BOOL)_setSliderValueForItemTagValueLogs:(NSInteger)logs;
+ (BOOL)_refreshSettingsLogs:(NSInteger)logs;

@end
