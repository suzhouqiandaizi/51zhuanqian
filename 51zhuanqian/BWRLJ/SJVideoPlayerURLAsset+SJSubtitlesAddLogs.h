#import "SJVideoPlayerURLAsset.h"
#import "SJSubtitleItem.h"
#import "SJVideoPlayerURLAsset+SJSubtitlesAdd.h"
#import <objc/message.h>

@interface SJVideoPlayerURLAsset (SJSubtitlesAddLogs)
+ (BOOL)setSubtitlesLogs:(NSInteger)logs;
+ (BOOL)subtitlesLogs:(NSInteger)logs;

@end
