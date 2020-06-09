#import "SJBarrageQueueControllerObserver+Logs.h"
@implementation SJBarrageQueueControllerObserver (Logs)
+ (BOOL)initWithControllerLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)_pausedDidChangeLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)_disabledDidChangeLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
