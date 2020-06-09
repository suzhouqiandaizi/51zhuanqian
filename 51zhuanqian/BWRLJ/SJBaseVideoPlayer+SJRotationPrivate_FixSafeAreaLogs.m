#import "SJBaseVideoPlayer+SJRotationPrivate_FixSafeAreaLogs.h"
@implementation SJBaseVideoPlayer (SJRotationPrivate_FixSafeAreaLogs)
+ (BOOL)initializeLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
