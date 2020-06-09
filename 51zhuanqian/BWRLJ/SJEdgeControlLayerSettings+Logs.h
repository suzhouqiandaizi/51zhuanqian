#import <UIKit/UIKit.h>
#import "SJEdgeControlLayerSettings.h"
#import <UIKit/UIKit.h>
#import "SJEdgeControlLayerLoader.h"

@interface SJEdgeControlLayerSettings (Logs)
+ (BOOL)commonSettingsLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(SJEdgeControlLayerSettings * _Nonnull)))updateLogs:(NSInteger)logs;
+ (BOOL)postUpdateNotifyLogs:(NSInteger)logs;
+ (BOOL)resetLogs:(NSInteger)logs;

@end
