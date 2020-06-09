#import "SJEdgeControlLayerSettings+Logs.h"
@implementation SJEdgeControlLayerSettings (Logs)
+ (BOOL)commonSettingsLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)(void (^ _Nonnull)(SJEdgeControlLayerSettings * _Nonnull)))updateLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)postUpdateNotifyLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)resetLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
