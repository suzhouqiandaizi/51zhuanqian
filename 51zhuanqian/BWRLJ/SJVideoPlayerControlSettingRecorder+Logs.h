#import <UIKit/UIKit.h>
#import "SJEdgeControlLayerSettings.h"
#import "UIView+SJVideoPlayerSetting.h"
#import <objc/message.h>

@interface SJVideoPlayerControlSettingRecorder (Logs)
+ (BOOL)initWithSettingsLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;

@end
