#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHLaunchAdDownloader.h"
#import "XHLaunchAdCache.h"
#import "FLAnimatedImage.h"
#import "XHLaunchAdConst.h"

@interface XHLaunchAdDownloader (Logs)
+ (BOOL)sharedDownloaderLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)downloadImageWithURLProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)downloadImageAndCacheWithURLCompletedLogs:(NSInteger)logs;
+ (BOOL)downLoadImageAndCacheWithURLArrayLogs:(NSInteger)logs;
+ (BOOL)downLoadImageAndCacheWithURLArrayCompletedLogs:(NSInteger)logs;
+ (BOOL)downloadVideoWithURLProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)downloadVideoAndCacheWithURLCompletedLogs:(NSInteger)logs;
+ (BOOL)downLoadVideoAndCacheWithURLArrayLogs:(NSInteger)logs;
+ (BOOL)downLoadVideoAndCacheWithURLArrayCompletedLogs:(NSInteger)logs;
+ (BOOL)allDownloadDictLogs:(NSInteger)logs;
+ (BOOL)downloadFinishWithURLLogs:(NSInteger)logs;
+ (BOOL)keyWithURLLogs:(NSInteger)logs;

@end
