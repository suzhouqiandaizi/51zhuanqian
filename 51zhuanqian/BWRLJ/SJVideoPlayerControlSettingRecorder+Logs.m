#import "SJVideoPlayerControlSettingRecorder+Logs.h"
@implementation SJVideoPlayerControlSettingRecorder (Logs)
+ (BOOL)initWithSettingsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
