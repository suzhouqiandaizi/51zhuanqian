#import "XHLaunchAdImageManager+Logs.h"
@implementation XHLaunchAdImageManager (Logs)
+ (BOOL)sharedManagerLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)loadImageWithURLOptionsProgressCompletedLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
