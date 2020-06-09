#import "SJEdgeControlLayerAdapters.h"
#import "SJControlLayerDefines.h"
#import "SJFilmEditingStatus.h"
#import "SJFilmEditingInVideoRecordingsControlLayer.h"
#import "UIView+SJAnimationAdded.h"
#import "SJVideoPlayerAnimationHeader.h"
#import "SJFilmEditingSettings.h"
#import "SJFilmEditingBackButton.h"
#import "SJFilmEditingButtonContainerView.h"
#import "SJFilmEditingVideoCountDownView.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJBaseVideoPlayer/NSTimer+SJAssetAdd.h>
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "NSTimer+SJAssetAdd.h"
#import "SJBaseVideoPlayer.h"

@interface SJFilmEditingInVideoRecordingsControlLayer (Logs)
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)durationLogs:(NSInteger)logs;
+ (BOOL)rangeLogs:(NSInteger)logs;
+ (BOOL)resumeLogs:(NSInteger)logs;
+ (BOOL)pauseLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;
+ (BOOL)finishedLogs:(NSInteger)logs;
+ (BOOL)setCountDownNumLogs:(NSInteger)logs;
+ (BOOL)setStatusLogs:(NSInteger)logs;
+ (BOOL)_cleanTimerLogs:(NSInteger)logs;
+ (BOOL)clickedDoneItemLogs:(NSInteger)logs;
+ (BOOL)_setupViewsLogs:(NSInteger)logs;
+ (BOOL)_addItemToTopAdapterLogs:(NSInteger)logs;
+ (BOOL)_addItemToRightAdapterLogs:(NSInteger)logs;
+ (BOOL)_addItemToBottomAdapterLogs:(NSInteger)logs;
+ (BOOL)_updateTopItemSettingsLogs:(NSInteger)logs;
+ (BOOL)_updateRightItemSettingsLogs:(NSInteger)logs;
+ (BOOL)_updateBottomItemSettingsLogs:(NSInteger)logs;
+ (BOOL)_initializeObserverLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)videoPlayerPlaybackStatusDidChangeLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;
+ (BOOL)receivedApplicationDidBecomeActiveNotificationLogs:(NSInteger)logs;
+ (BOOL)drawRectLogs:(NSInteger)logs;

@end