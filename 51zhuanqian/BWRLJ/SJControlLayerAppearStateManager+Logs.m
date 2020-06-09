#import "SJControlLayerAppearStateManager+Logs.h"
@implementation SJControlLayerAppearStateManager (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)getObserverLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setIntervalLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)intervalLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)switchAppearStateLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)needAppearLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)needDisappearLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)resumeLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)keepAppearStateLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)keepDisappearStateLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)setIsAppearedLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)setDisabledLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)_startLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)_clearLogs:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
