#import <Foundation/Foundation.h>
#import "SJVideoPlayerSettings.h"
#import <UIKit/UIKit.h>
#import "SJFilmEditingSettings.h"
#import "SJEdgeControlLayerSettings.h"
#import "SJFloatSmallViewControlLayerResourceLoader.h"
#import <objc/message.h>

@interface SJVideoPlayerSettings (Logs)
+ (BOOL)commonSettingsLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(SJVideoPlayerSettings * _Nonnull)))updateLogs:(NSInteger)logs;
+ (BOOL)resetLogs:(NSInteger)logs;
+ (BOOL)forwardingTargetForSelectorLogs:(NSInteger)logs;

@end
