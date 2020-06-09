#import <Foundation/Foundation.h>
#import "SJControlLayerDefines.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import "SJControlLayerSwitcher.h"

@interface SJControlLayerSwitcherObsrever (Logs)
+ (BOOL)initWithSwitcherLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)willBeginSwitchControlLayerLogs:(NSInteger)logs;
+ (BOOL)didEndSwitchControlLayerLogs:(NSInteger)logs;

@end
