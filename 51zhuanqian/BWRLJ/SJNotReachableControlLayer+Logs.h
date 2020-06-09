#import "SJEdgeControlLayerAdapters.h"
#import "SJControlLayerDefines.h"
#import "SJNotReachableControlLayer.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import "UIView+SJVideoPlayerSetting.h"
#import "UIView+SJAnimationAdded.h"
#import "SJVideoPlayerAnimationHeader.h"

@interface SJNotReachableControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)controlViewLogs:(NSInteger)logs;
+ (BOOL)installedControlViewToVideoPlayerLogs:(NSInteger)logs;
+ (BOOL)restartControlLayerLogs:(NSInteger)logs;
+ (BOOL)exitControlLayerLogs:(NSInteger)logs;
+ (BOOL)clickedBackItemLogs:(NSInteger)logs;
+ (BOOL)clickedReloadButtonLogs:(NSInteger)logs;
+ (BOOL)_setupViewLogs:(NSInteger)logs;
+ (BOOL)videoPlayerGesturerecognizershouldtriggerLocationLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedAppearLogs:(NSInteger)logs;
+ (BOOL)controlLayerNeedDisappearLogs:(NSInteger)logs;
+ (BOOL)videoPlayerWillrotateviewLogs:(NSInteger)logs;
+ (BOOL)videoPlayerWillfitonscreenLogs:(NSInteger)logs;
+ (BOOL)_updateItemsLogs:(NSInteger)logs;

@end
