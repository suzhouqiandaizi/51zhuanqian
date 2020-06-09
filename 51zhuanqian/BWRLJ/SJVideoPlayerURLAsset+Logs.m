#import "SJVideoPlayerURLAsset+Logs.h"
@implementation SJVideoPlayerURLAsset (Logs)
+ (BOOL)initWithURLSpecifystarttimePlaymodelLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)initWithURLSpecifystarttimeLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)initWithURLPlaymodelLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)initWithURLLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)initWithOtherAssetPlaymodelLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)isM3u8Logs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)playModelLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)getObserverLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)originMediaLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
