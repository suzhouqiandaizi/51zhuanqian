#import <Foundation/Foundation.h>
#import "NSTimer+HYHWeaklyTimer.h"

@interface NSTimer (HYHWeaklyTimerLogs)
+ (BOOL)yh_weaklyTimerWithTimerIntervalExcuteblockRepeatLogs:(NSInteger)logs;
+ (BOOL)pYH_excuteLogs:(NSInteger)logs;

@end
