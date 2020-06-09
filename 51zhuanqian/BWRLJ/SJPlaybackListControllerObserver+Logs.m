#import "SJPlaybackListControllerObserver+Logs.h"
@implementation SJPlaybackListControllerObserver (Logs)
+ (BOOL)initWithListControllerLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
