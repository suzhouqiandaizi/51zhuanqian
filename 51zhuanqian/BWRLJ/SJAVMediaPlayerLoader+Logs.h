#import <Foundation/Foundation.h>
#import "SJAVMediaPlayer.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJAVMediaPlayerLoader.h"
#import "SJAVMediaPlayer.h"
#import <objc/message.h>

@interface SJAVMediaPlayerLoader (Logs)
+ (BOOL)loadPlayerForMediaLogs:(NSInteger)logs;
+ (BOOL)clearPlayerForMediaLogs:(NSInteger)logs;

@end
