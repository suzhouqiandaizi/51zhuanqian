#import "SJVideoPlayerURLAsset+SJAVMediaPlaybackAddLogs.h"
@implementation SJVideoPlayerURLAsset (SJAVMediaPlaybackAddLogs)
+ (BOOL)initWithAVAssetLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)initWithAVAssetPlaymodelLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)initWithAVAssetSpecifystarttimePlaymodelLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setAvAssetLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)avAssetLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
