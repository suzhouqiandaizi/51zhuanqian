#import "NSTimer+HYHWeaklyTimerLogs.h"
@implementation NSTimer (HYHWeaklyTimerLogs)
+ (BOOL)yh_weaklyTimerWithTimerIntervalExcuteblockRepeatLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)pYH_excuteLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
