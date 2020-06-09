#import "SJVideoPlayerURLAsset+SJSubtitlesAddLogs.h"
@implementation SJVideoPlayerURLAsset (SJSubtitlesAddLogs)
+ (BOOL)setSubtitlesLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)subtitlesLogs:(NSInteger)logs {
    return logs % 40 == 0;
}

@end
