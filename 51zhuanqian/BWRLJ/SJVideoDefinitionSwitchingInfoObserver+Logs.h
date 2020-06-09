#import <Foundation/Foundation.h>
#import "SJVideoPlayerURLAsset.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJVideoDefinitionSwitchingInfo.h"

@interface SJVideoDefinitionSwitchingInfoObserver (Logs)
+ (BOOL)initWithInfoLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;

@end
