#import <Foundation/Foundation.h>
#import "SJControlLayerDefines.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer.h>
#import "SJBaseVideoPlayer.h"
#import "SJControlLayerSwitcher.h"

@interface SJControlLayerSwitcher (Logs)
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)initWithPlayerLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)switchControlLayerForIdentitfierLogs:(NSInteger)logs;
+ (BOOL)switchToPreviousControlLayerLogs:(NSInteger)logs;
+ (BOOL)addControlLayerForIdentifierLazyloadingLogs:(NSInteger)logs;
+ (BOOL)deleteControlLayerForIdentifierLogs:(NSInteger)logs;
+ (BOOL)controlLayerForIdentifierLogs:(NSInteger)logs;
+ (BOOL)containsControlLayerLogs:(NSInteger)logs;

@end
