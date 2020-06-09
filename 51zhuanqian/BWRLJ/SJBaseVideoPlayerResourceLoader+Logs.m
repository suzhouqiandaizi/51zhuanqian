#import "SJBaseVideoPlayerResourceLoader+Logs.h"
@implementation SJBaseVideoPlayerResourceLoader (Logs)
+ (BOOL)bundleLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)imageNamedLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
