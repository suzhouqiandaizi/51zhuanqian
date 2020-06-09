#import "SJBaseVideoPlayer+DeviceVolumeAndBrightnessLogs.h"
@implementation SJBaseVideoPlayer (DeviceVolumeAndBrightnessLogs)
+ (BOOL)setDeviceVolumeAndBrightnessManagerLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)deviceVolumeAndBrightnessManagerLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)_configDeviceVolumeAndBrightnessManagerLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)deviceVolumeAndBrightnessObserverLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)setDisableBrightnessSettingLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)disableBrightnessSettingLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)setDisableVolumeSettingLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)disableVolumeSettingLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
