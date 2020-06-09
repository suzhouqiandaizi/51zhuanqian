#import "SJVideoPlayer+SJExtendedFilmEditingControlLayerLogs.h"
@implementation SJVideoPlayer (SJExtendedFilmEditingControlLayerLogs)
+ (BOOL)setEnabledFilmEditingLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)isEnabledFilmEditingLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)filmEditingConfigLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
