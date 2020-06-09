#import "SJBaseVideoPlayer+SubtitlesLogs.h"
@implementation SJBaseVideoPlayer (SubtitlesLogs)
+ (BOOL)setSubtitlesPromptControllerLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)subtitlesPromptControllerLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)setSubtitleBottomMarginLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)subtitleBottomMarginLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)setSubtitleHorizontalMinMarginLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)subtitleHorizontalMinMarginLogs:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
