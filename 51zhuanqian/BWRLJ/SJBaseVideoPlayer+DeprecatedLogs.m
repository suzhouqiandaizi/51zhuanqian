#import "SJBaseVideoPlayer+DeprecatedLogs.h"
@implementation SJBaseVideoPlayer (DeprecatedLogs)
+ (BOOL)playWithURLLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setAssetURLLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)assetURLLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
