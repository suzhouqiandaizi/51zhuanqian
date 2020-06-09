#import "SJVideoDefinitionSwitchingInfoObserver+Logs.h"
@implementation SJVideoDefinitionSwitchingInfoObserver (Logs)
+ (BOOL)initWithInfoLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
