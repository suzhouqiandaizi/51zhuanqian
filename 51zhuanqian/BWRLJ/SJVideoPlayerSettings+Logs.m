#import "SJVideoPlayerSettings+Logs.h"
@implementation SJVideoPlayerSettings (Logs)
+ (BOOL)commonSettingsLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)(void (^ _Nonnull)(SJVideoPlayerSettings * _Nonnull)))updateLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)resetLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)forwardingTargetForSelectorLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
