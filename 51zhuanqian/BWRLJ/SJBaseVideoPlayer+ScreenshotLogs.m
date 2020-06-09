#import "SJBaseVideoPlayer+ScreenshotLogs.h"
@implementation SJBaseVideoPlayer (ScreenshotLogs)
+ (BOOL)setPresentationSizeDidChangeExeBlockLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)(__kindof SJBaseVideoPlayer * _Nonnull))presentationSizeDidChangeExeBlockLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)videoPresentationSizeLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)screenshotLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)screenshotWithTimeCompletionLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)screenshotWithTimeSizeCompletionLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
