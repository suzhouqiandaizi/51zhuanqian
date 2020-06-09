#import <Foundation/Foundation.h>
#import "SDWebImageManager.h"
#import "SDWebImagePrefetcher.h"

@interface SDWebImagePrefetcher (Logs)
+ (BOOL)sharedImagePrefetcherLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithImageManagerLogs:(NSInteger)logs;
+ (BOOL)setMaxConcurrentDownloadsLogs:(NSInteger)logs;
+ (BOOL)maxConcurrentDownloadsLogs:(NSInteger)logs;
+ (BOOL)startPrefetchingAtIndexLogs:(NSInteger)logs;
+ (BOOL)reportStatusLogs:(NSInteger)logs;
+ (BOOL)prefetchURLsLogs:(NSInteger)logs;
+ (BOOL)prefetchURLsProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)cancelPrefetchingLogs:(NSInteger)logs;

@end
