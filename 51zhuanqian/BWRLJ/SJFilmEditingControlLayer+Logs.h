#import "SJEdgeControlLayerAdapters.h"
#import "SJVideoPlayerFilmEditingConfig.h"
#import "SJControlLayerDefines.h"
#import "SJFilmEditingControlLayer.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"  
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"
#import "UIView+SJAnimationAdded.h"
#import "SJVideoPlayerAnimationHeader.h"
#import "SJFilmEditingSettings.h"
#import "SJFilmEditingInGIFRecordingsControlLayer.h"
#import "SJFilmEditingInVideoRecordingsControlLayer.h"
#import "SJFilmEditingGenerateResultControlLayer.h"
#import "SJControlLayerSwitcher.h"
#import "SJVideoPlayerFilmEditingParameters.h"

@interface SJFilmEditingControlLayer (Logs)
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)clickedScreenshotItemLogs:(NSInteger)logs;
+ (BOOL)clickedExportVideoItemLogs:(NSInteger)logs;
+ (BOOL)clickedExportGIFItemLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;
+ (BOOL)_createParametersWithOperationRangeLogs:(NSInteger)logs;
+ (BOOL)_generateResultWithParametersLogs:(NSInteger)logs;
+ (BOOL)_setupViewsLogs:(NSInteger)logs;
+ (BOOL)_addItemToRightAdapterLogs:(NSInteger)logs;
+ (BOOL)_updateRightItemSettingsLogs:(NSInteger)logs;
+ (BOOL)_initializeObserverLogs:(NSInteger)logs;
+ (BOOL)_initializeSwitcherLogs:(NSInteger)logs;
+ (BOOL)setConfigLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;

@end
