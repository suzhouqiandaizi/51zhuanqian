#import "FLWeakProxy+Logs.h"
@implementation FLWeakProxy (Logs)
+ (BOOL)weakProxyForObjectLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)forwardingTargetForSelectorLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)forwardInvocationLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)methodSignatureForSelectorLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
