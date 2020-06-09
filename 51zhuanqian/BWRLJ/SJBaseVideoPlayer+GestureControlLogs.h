#import <UIKit/UIKit.h>
#import "SJFitOnScreenManagerDefines.h"
#import "SJRotationManagerDefines.h"
#import "SJVideoPlayerControlLayerProtocol.h"
#import "SJControlLayerAppearManagerDefines.h"
#import "SJFlipTransitionManagerDefines.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJVideoPlayerURLAsset+SJAVMediaPlaybackAdd.h"
#import "SJPlayerGestureControlDefines.h"
#import "SJDeviceVolumeAndBrightnessManagerDefines.h"
#import "SJFloatSmallViewControllerDefines.h"
#import "SJEdgeFastForwardViewControllerDefines.h"
#import "SJVideoDefinitionSwitchingInfo.h"
#import "SJPopPromptControllerDefines.h"
#import "SJPlaybackObservation.h"
#import "SJVideoPlayerPresentViewDefines.h"
#import "SJSubtitlesPromptControllerDefines.h"
#import "SJBarrageQueueControllerDefines.h"
#import "SJPromptDefines.h"
#import "SJBaseVideoPlayer.h"
#import <objc/message.h>
#import "SJRotationManager.h"
#import "SJDeviceVolumeAndBrightnessManager.h"
#import "SJVideoPlayerRegistrar.h"
#import "SJVideoPlayerPresentView.h"
#import "SJPlayModelPropertiesObserver.h"
#import "SJTimerControl.h"
#import "UIScrollView+ListViewAutoplaySJAdd.h"
#import "SJAVMediaPlaybackController.h"
#import "SJReachability.h"
#import "SJControlLayerAppearStateManager.h"
#import "SJFitOnScreenManager.h"
#import "SJFlipTransitionManager.h"
#import "SJPlayerView.h"
#import "SJFloatSmallViewController.h"
#import "SJEdgeFastForwardViewController.h"
#import "SJVideoDefinitionSwitchingInfo+Private.h"
#import "SJPopPromptController.h"
#import "SJPrompt.h"
#import "SJBaseVideoPlayerConst.h"
#import "SJSubtitlesPromptController.h"
#import "SJBaseVideoPlayer+TestLog.h"
#import "SJVideoPlayerURLAsset+SJSubtitlesAdd.h"
#import "SJBarrageQueueController.h"
#import "SJViewControllerManager.h"
#import "UIView+SJBaseVideoPlayerExtended.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"

@interface SJBaseVideoPlayer (GestureControlLogs)
+ (BOOL)gestureControlLogs:(NSInteger)logs;
+ (BOOL)setGestureRecognizerShouldTriggerLogs:(NSInteger)logs;
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull, SJPlayerGestureType, CGPoint))gestureRecognizerShouldTriggerLogs:(NSInteger)logs;
+ (BOOL)setFastForwardViewControllerLogs:(NSInteger)logs;
+ (BOOL)fastForwardViewControllerLogs:(NSInteger)logs;
+ (BOOL)_needUpdateFastForwardControllerPropertiesLogs:(NSInteger)logs;
+ (BOOL)setAllowHorizontalTriggeringOfPanGesturesInCellsLogs:(NSInteger)logs;
+ (BOOL)allowHorizontalTriggeringOfPanGesturesInCellsLogs:(NSInteger)logs;

@end
