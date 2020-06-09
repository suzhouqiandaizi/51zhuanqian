#import <UIKit/UIKit.h>
#import "SJDeviceVolumeAndBrightnessManagerDefines.h"
#import "SJDeviceVolumeAndBrightnessManager.h"
#import "SJBaseVideoPlayerResourceLoader.h"
#import "SJBaseVideoPlayerConst.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPVolumeView.h>
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import <SJUIKit/SJRunLoopTaskQueue.h>
#import "NSObject+SJObserverHelper.h"
#import "SJRunLoopTaskQueue.h"

@interface SJDeviceVolumeAndBrightnessManager (Logs)
+ (BOOL)loadLogs:(NSInteger)logs;
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)prepareLogs:(NSInteger)logs;
+ (BOOL)targetViewLogs:(NSInteger)logs;
+ (BOOL)_addOrRemoveSysVolumeViewLogs:(NSInteger)logs;
+ (BOOL)_volumeDidChangeLogs:(NSInteger)logs;
+ (BOOL)setVolumeLogs:(NSInteger)logs;
+ (BOOL)_syncVolumeLogs:(NSInteger)logs;
+ (BOOL)sysVolumeViewLogs:(NSInteger)logs;
+ (BOOL)volumeViewLogs:(NSInteger)logs;
+ (BOOL)volumeViewModelLogs:(NSInteger)logs;
+ (BOOL)_refreshDataForVolumeViewLogs:(NSInteger)logs;
+ (BOOL)_showVolumeViewIfNeededLogs:(NSInteger)logs;
+ (BOOL)_hiddenVolumeViewLogs:(NSInteger)logs;
+ (BOOL)_brightnessDidChangeLogs:(NSInteger)logs;
+ (BOOL)setBrightnessLogs:(NSInteger)logs;
+ (BOOL)brightnessLogs:(NSInteger)logs;
+ (BOOL)brightnessViewLogs:(NSInteger)logs;
+ (BOOL)brightnessViewModelLogs:(NSInteger)logs;
+ (BOOL)_refreshDataForBrightnessViewLogs:(NSInteger)logs;
+ (BOOL)_showBrightnessViewIfNeededLogs:(NSInteger)logs;
+ (BOOL)_hiddenBrightnessViewLogs:(NSInteger)logs;
+ (BOOL)handleVolumeDidChangeEventLogs:(NSInteger)logs;
+ (BOOL)handleBrightnessDidChangeNotificationLogs:(NSInteger)logs;
+ (BOOL)setTraceColorLogs:(NSInteger)logs;
+ (BOOL)traceColorLogs:(NSInteger)logs;
+ (BOOL)setTrackColorLogs:(NSInteger)logs;
+ (BOOL)trackColorLogs:(NSInteger)logs;

@end
