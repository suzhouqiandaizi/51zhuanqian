#import "SJBaseVideoPlayer+AutoManageViewToFitOnScreenOrRotationLogs.h"
@implementation SJBaseVideoPlayer (AutoManageViewToFitOnScreenOrRotationLogs)
+ (BOOL)setAutoManageViewToFitOnScreenOrRotationLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)autoManageViewToFitOnScreenOrRotationLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
