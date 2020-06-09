#import "SJVideoPlayer+CommonSettingsLogs.h"
@implementation SJVideoPlayer (CommonSettingsLogs)
+ (BOOL)(void (^ _Nonnull)(SJVideoPlayerSettings * _Nonnull)))updateLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)resetSettingLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
