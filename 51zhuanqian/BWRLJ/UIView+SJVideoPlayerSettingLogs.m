#import "UIView+SJVideoPlayerSettingLogs.h"
@implementation UIView (SJVideoPlayerSettingLogs)
+ (BOOL)setSettingRecroderLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)settingRecroderLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
