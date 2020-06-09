#import "SDWebImagePrefetcher+Logs.h"
@implementation SDWebImagePrefetcher (Logs)
+ (BOOL)sharedImagePrefetcherLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)initWithImageManagerLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setMaxConcurrentDownloadsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)maxConcurrentDownloadsLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)startPrefetchingAtIndexLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)reportStatusLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)prefetchURLsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)prefetchURLsProgressCompletedLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)cancelPrefetchingLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
