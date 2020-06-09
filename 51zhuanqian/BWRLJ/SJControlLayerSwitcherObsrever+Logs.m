#import "SJControlLayerSwitcherObsrever+Logs.h"
@implementation SJControlLayerSwitcherObsrever (Logs)
+ (BOOL)initWithSwitcherLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)willBeginSwitchControlLayerLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)didEndSwitchControlLayerLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
