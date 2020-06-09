#import "SJVideoPlayerControlMaskView+Logs.h"
@implementation SJVideoPlayerControlMaskView (Logs)
+ (BOOL)layerClassLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)initWithStyleLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)cleanColorsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
