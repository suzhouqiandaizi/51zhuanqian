#import "SJEdgeControlLayerAdapters.h"
#import "SJVideoPlayerFilmEditingCommonHeader.h"
#import "SJControlLayerDefines.h"
#import "SJFilmEditingGenerateResultControlLayer.h"
#import "UIView+SJAnimationAdded.h"
#import "SJVideoPlayerAnimationHeader.h"
#import "SJFilmEditingSettings.h"
#import "SJFilmEditingBackButton.h"
#import "SJFilmEditingButtonContainerView.h"
#import "SJFilmEditingResultShareItem.h"
#import "SJFilmEditingResultShareItemsContainerView.h"
#import "SJVideoPlayerFilmEditingGeneratedResult.h"
#import "SJFilmEditingSaveResultToAlbumHandler.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"

@interface SJFilmEditingGenerateResultControlLayer (Logs)
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)_getScreenshotLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)setShareItemsLogs:(NSInteger)logs;
+ (BOOL)shareItemsLogs:(NSInteger)logs;
+ (BOOL)_generateResultLogs:(NSInteger)logs;
+ (BOOL)_generateScreenshotLogs:(NSInteger)logs;
+ (BOOL)_generateVideoLogs:(NSInteger)logs;
+ (BOOL)_generateGIFLogs:(NSInteger)logs;
+ (BOOL)_uploadResultIfNeededLogs:(NSInteger)logs;
+ (BOOL)_updatePromptLabelTextLogs:(NSInteger)logs;
+ (BOOL)_cancelLogs:(NSInteger)logs;
+ (BOOL)_handleClickedShareItemEventLogs:(NSInteger)logs;
+ (BOOL)_setupViewsLogs:(NSInteger)logs;
+ (BOOL)_addItemToTopAdapterLogs:(NSInteger)logs;
+ (BOOL)_updateTopItemSettingsLogs:(NSInteger)logs;
+ (BOOL)_initializeObserverLogs:(NSInteger)logs;
+ (BOOL)exportedVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)saveHandlerLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)canTriggerRotationOfVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)canPerformPlayForVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;

@end
