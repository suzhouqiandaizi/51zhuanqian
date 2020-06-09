#import "SJVideoPlayerURLAssetPrefetcher+Logs.h"
@implementation SJVideoPlayerURLAssetPrefetcher (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)prefetchAssetLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)assetForURLLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)assetForIdentifierLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)removeAssetLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)_indexOfAssetLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
