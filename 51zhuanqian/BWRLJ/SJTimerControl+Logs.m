#import "SJTimerControl+Logs.h"
@implementation SJTimerControl (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)setIntervalLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)startLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)clearLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
