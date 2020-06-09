#import <Foundation/Foundation.h>
#import "SJVideoPlayerURLAsset.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJVideoDefinitionSwitchingInfo.h"

@interface SJVideoDefinitionSwitchingInfo (Logs)
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)setStatusLogs:(NSInteger)logs;

@end
