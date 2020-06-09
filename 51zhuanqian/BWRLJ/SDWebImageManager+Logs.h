#import "SDWebImageCompat.h"
#import "SDWebImageOperation.h"
#import "SDWebImageDownloader.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import <objc/message.h>
#import "NSImage+WebCache.h"

@interface SDWebImageManager (Logs)
+ (BOOL)sharedManagerLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithCacheDownloaderLogs:(NSInteger)logs;
+ (BOOL)cacheKeyForURLLogs:(NSInteger)logs;
+ (BOOL)cachedImageExistsForURLCompletionLogs:(NSInteger)logs;
+ (BOOL)diskImageExistsForURLCompletionLogs:(NSInteger)logs;
+ (BOOL)loadImageWithURLOptionsProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)saveImageToCacheForurlLogs:(NSInteger)logs;
+ (BOOL)cancelAllLogs:(NSInteger)logs;
+ (BOOL)isRunningLogs:(NSInteger)logs;
+ (BOOL)safelyRemoveOperationFromRunningLogs:(NSInteger)logs;
+ (BOOL)callCompletionBlockForOperationCompletionErrorUrlLogs:(NSInteger)logs;
+ (BOOL)callCompletionBlockForOperationCompletionImageDataErrorCachetypeFinishedUrlLogs:(NSInteger)logs;

@end
