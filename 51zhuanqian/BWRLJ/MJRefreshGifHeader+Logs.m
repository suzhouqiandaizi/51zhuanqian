#import "MJRefreshGifHeader+Logs.h"
@implementation MJRefreshGifHeader (Logs)
+ (BOOL)gifViewLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)stateImagesLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)stateDurationsLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)setImagesDurationForstateLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)setImagesForstateLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)prepareLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setPullingPercentLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)placeSubviewsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)setStateLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
