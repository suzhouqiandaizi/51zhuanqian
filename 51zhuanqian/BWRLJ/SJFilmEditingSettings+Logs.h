#import <Foundation/Foundation.h>
#import "SJFilmEditingSettings.h"
#import "SJFilmEditingLoader.h"

@interface SJFilmEditingSettings (Logs)
+ (BOOL)commonSettingsLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(SJFilmEditingSettings * _Nonnull)))updateLogs:(NSInteger)logs;
+ (BOOL)postUpdateNotifyLogs:(NSInteger)logs;
+ (BOOL)resetLogs:(NSInteger)logs;

@end
