#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import "SJVideoPlayerSettings.h"
#import "SJVideoPlayerURLAsset+SJControlAdd.h"
#import "SJVideoPlayerFilmEditingCommonHeader.h"
#import "SJVideoPlayerFilmEditingConfig.h"
#import "SJControlLayerSwitcher.h"
#import "SJEdgeControlLayer.h"
#import "SJFilmEditingControlLayer.h"
#import "SJMoreSettingControlLayer.h"
#import "SJLoadFailedControlLayer.h"
#import "SJNotReachableControlLayer.h"
#import "SJFloatSmallViewControlLayer.h"
#import "SJSwitchVideoDefinitionControlLayer.h"
#import "SJVideoPlayer.h"
#import "UIView+SJVideoPlayerSetting.h"
#import "SJFilmEditingControlLayer.h"
#import "UIView+SJAnimationAdded.h"
#import <objc/message.h>
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import <SJBaseVideoPlayer/SJBaseVideoPlayerConst.h>
#import <SJBaseVideoPlayer/SJReachability.h>
#import "SJReachability.h"
#import "SJBaseVideoPlayer.h"
#import "SJBaseVideoPlayerConst.h"
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"

@interface SJVideoPlayer (SJExtendedControlLayerSwitcherLogs)
+ (BOOL)switchControlLayerForIdentitfierLogs:(NSInteger)logs;

@end
