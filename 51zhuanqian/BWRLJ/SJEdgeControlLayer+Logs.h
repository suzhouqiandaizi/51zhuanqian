#import "SJEdgeControlLayerAdapters.h"
#import "SJControlLayerDefines.h"
#import "SJEdgeControlLayerLoadingViewDefines.h"
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import <SJBaseVideoPlayer/SJTimerControl.h>
#import "SJBaseVideoPlayer.h"
#import "SJTimerControl.h"
#import "SJEdgeControlLayer.h"
#import "SJVideoPlayerURLAsset+SJControlAdd.h"
#import "SJVideoPlayerDraggingProgressView.h"
#import "SJVideoPlayerAnimationHeader.h"
#import "UIView+SJVideoPlayerSetting.h"
#import "UIView+SJAnimationAdded.h"
#import "SJProgressSlider.h"
#import "SJNetworkLoadingView.h"

@interface SJEdgeControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)_tappedResidentBackButtonLogs:(NSInteger)logs;
+ (BOOL)_tappedBackItemLogs:(NSInteger)logs;
+ (BOOL)_tappedLockItemLogs:(NSInteger)logs;
+ (BOOL)_tappedPlayItemLogs:(NSInteger)logs;
+ (BOOL)_tappedFullItemLogs:(NSInteger)logs;
+ (BOOL)_tappedReplayItemLogs:(NSInteger)logs;
+ (BOOL)_setupViewLogs:(NSInteger)logs;
+ (BOOL)_addItemsToTopAdapterLogs:(NSInteger)logs;
+ (BOOL)_addItemsToLeftAdapterLogs:(NSInteger)logs;
+ (BOOL)_addItemsToBottomAdapterLogs:(NSInteger)logs;
+ (BOOL)_addItemsToRightAdapterLogs:(NSInteger)logs;
+ (BOOL)_addItemsToCenterAdapterLogs:(NSInteger)logs;
+ (BOOL)residentBackButtonLogs:(NSInteger)logs;
+ (BOOL)setShowResidentBackButtonHidenLogs:(NSInteger)logs;
+ (BOOL)setShowResidentBackButtonLogs:(NSInteger)logs;
+ (BOOL)sliderWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)sliderValuedidchangeLogs:(NSInteger)logs;
+ (BOOL)sliderDidEndDraggingLogs:(NSInteger)logs;
+ (BOOL)bottomProgressIndicatorLogs:(NSInteger)logs;
+ (BOOL)setHiddenBottomProgressIndicatorLogs:(NSInteger)logs;
+ (BOOL)setBottomProgressIndicatorHeightLogs:(NSInteger)logs;
+ (BOOL)setLoadingViewLogs:(NSInteger)logs;
+ (BOOL)loadingViewLogs:(NSInteger)logs;
+ (BOOL)setShowNetworkSpeedToLoadingViewLogs:(NSInteger)logs;
+ (BOOL)draggingProgressViewLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)controlLayerOfVideoPlayerCanAutomaticallyDisappearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;
+ (BOOL)videoPlayerPreparetoplayLogs:(NSInteger)logs;
+ (BOOL)videoPlayerPlaybackStatusDidChangeLogs:(NSInteger)logs;
+ (BOOL)videoPlayerCurrenttimedidchangeLogs:(NSInteger)logs;
+ (BOOL)videoPlayerDurationdidchangeLogs:(NSInteger)logs;
+ (BOOL)videoPlayerPlayabledurationdidchangeLogs:(NSInteger)logs;
+ (BOOL)videoPlayerPlaybacktypedidchangeLogs:(NSInteger)logs;
+ (BOOL)videoPlayerWillrotateviewLogs:(NSInteger)logs;
+ (BOOL)videoPlayerDidendrotationLogs:(NSInteger)logs;
+ (BOOL)videoPlayerWillfitonscreenLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)videoPlayerPangesturetriggeredinthehorizontaldirectionProgresstimeLogs:(NSInteger)logs;
+ (BOOL)tappedPlayerOnTheLockedStateLogs:(NSInteger)logs;
+ (BOOL)lockedVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)unlockedVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)videoPlayerReachabilitychangedLogs:(NSInteger)logs;
+ (BOOL)lockStateTappedTimerControlLogs:(NSInteger)logs;
+ (BOOL)_updateContainerViewsAppearStateLogs:(NSInteger)logs;
+ (BOOL)_updateTopContainerViewAppearStateLogs:(NSInteger)logs;
+ (BOOL)_updateLeftContainerViewAppearStateLogs:(NSInteger)logs;
+ (BOOL)_updateBottomContainerViewAppearStateLogs:(NSInteger)logs;
+ (BOOL)_updateRightContainerViewAppearStateLogs:(NSInteger)logs;
+ (BOOL)_updateCenterContainerViewAppearStateLogs:(NSInteger)logs;
+ (BOOL)_updateAdaptersIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateTopAdapterIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateLeftAdapterIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateBottomAdapterIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateRightAdapterIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateCenterAdapterIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateBottomCurrentTimeItemIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateBottomDurationItemIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateBottomTimeLabelSizeLogs:(NSInteger)logs;
+ (BOOL)_updateBottomProgressSliderItemIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateBottomProgressIndicatorIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateDraggingProgressViewCurrentTimeIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateResidentBackButtonAppearStateIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updateNetworkSpeedStrForLoadingViewLogs:(NSInteger)logs;
+ (BOOL)_textForTimeStringLogs:(NSInteger)logs;
+ (BOOL)_resetControlLayerAppearIntervalForItemIfNeededLogs:(NSInteger)logs;
+ (BOOL)_showOrRemoveBottomProgressIndicatorLogs:(NSInteger)logs;
+ (BOOL)_showOrHiddenLoadingViewLogs:(NSInteger)logs;
+ (BOOL)_onDragStartLogs:(NSInteger)logs;
+ (BOOL)_onDragMovingLogs:(NSInteger)logs;
+ (BOOL)_onDragMoveEndLogs:(NSInteger)logs;

@end
