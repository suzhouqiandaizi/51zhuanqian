#import "SJBaseVideoPlayer+PlaceholderLogs.h"
@implementation SJBaseVideoPlayer (PlaceholderLogs)
+ (BOOL)presentViewLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)setHiddenPlaceholderImageViewWhenPlayerIsReadyForDisplayLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)hiddenPlaceholderImageViewWhenPlayerIsReadyForDisplayLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)setDelayInSecondsForHiddenPlaceholderImageViewLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)delayInSecondsForHiddenPlaceholderImageViewLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
