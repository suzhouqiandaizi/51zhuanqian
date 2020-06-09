#import "SJFilmEditingSettings+Logs.h"
@implementation SJFilmEditingSettings (Logs)
+ (BOOL)commonSettingsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)(void (^ _Nonnull)(SJFilmEditingSettings * _Nonnull)))updateLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)postUpdateNotifyLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)resetLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
