#import "SJBaseVideoPlayer+TestLogLogs.h"
@implementation SJBaseVideoPlayer (TestLogLogs)
+ (BOOL)showLog_TimeControlStatusLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)showLog_AssetStatusLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
