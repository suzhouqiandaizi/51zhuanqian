#import "SJControlLayerSwitcher+Logs.h"
@implementation SJControlLayerSwitcher (Logs)
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)initWithPlayerLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)getObserverLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)switchControlLayerForIdentitfierLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)switchToPreviousControlLayerLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)addControlLayerForIdentifierLazyloadingLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)deleteControlLayerForIdentifierLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)controlLayerForIdentifierLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)containsControlLayerLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
