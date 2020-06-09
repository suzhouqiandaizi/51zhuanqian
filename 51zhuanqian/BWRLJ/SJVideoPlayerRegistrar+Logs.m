#import "SJVideoPlayerRegistrar+Logs.h"
@implementation SJVideoPlayerRegistrar (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)stateLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
