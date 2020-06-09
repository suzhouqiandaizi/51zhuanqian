#import "SJPlaybackObservation+Logs.h"
@implementation SJPlaybackObservation (Logs)
+ (BOOL)initWithPlayerLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
