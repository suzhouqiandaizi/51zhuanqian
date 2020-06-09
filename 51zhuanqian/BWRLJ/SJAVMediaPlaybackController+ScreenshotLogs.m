#import "SJAVMediaPlaybackController+ScreenshotLogs.h"
@implementation SJAVMediaPlaybackController (ScreenshotLogs)
+ (BOOL)screenshotWithTimeSizeCompletionLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
