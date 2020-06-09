#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHLaunchAdCache.h"
#import <CommonCrypto/CommonDigest.h>
#import "XHLaunchAdConst.h"

@interface XHLaunchAdCache (Logs)
+ (BOOL)getCacheImageWithURLLogs:(NSInteger)logs;
+ (BOOL)getCacheImageDataWithURLLogs:(NSInteger)logs;
+ (BOOL)saveImageDataImageurlLogs:(NSInteger)logs;
+ (BOOL)async_saveImageDataImageurlCompletedLogs:(NSInteger)logs;
+ (BOOL)saveVideoAtLocationUrlLogs:(NSInteger)logs;
+ (BOOL)async_saveVideoAtLocationUrlCompletedLogs:(NSInteger)logs;
+ (BOOL)getCacheVideoWithURLLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdCachePathLogs:(NSInteger)logs;
+ (BOOL)imagePathWithURLLogs:(NSInteger)logs;
+ (BOOL)videoPathWithURLLogs:(NSInteger)logs;
+ (BOOL)videoPathWithFileNameLogs:(NSInteger)logs;
+ (BOOL)checkImageInCacheWithURLLogs:(NSInteger)logs;
+ (BOOL)checkVideoInCacheWithURLLogs:(NSInteger)logs;
+ (BOOL)checkVideoInCacheWithFileNameLogs:(NSInteger)logs;
+ (BOOL)checkDirectoryLogs:(NSInteger)logs;
+ (BOOL)async_saveImageUrlLogs:(NSInteger)logs;
+ (BOOL)getCacheImageUrlLogs:(NSInteger)logs;
+ (BOOL)async_saveVideoUrlLogs:(NSInteger)logs;
+ (BOOL)getCacheVideoUrlLogs:(NSInteger)logs;
+ (BOOL)clearDiskCacheLogs:(NSInteger)logs;
+ (BOOL)clearDiskCacheWithImageUrlArrayLogs:(NSInteger)logs;
+ (BOOL)clearDiskCacheExceptImageUrlArrayLogs:(NSInteger)logs;
+ (BOOL)clearDiskCacheWithVideoUrlArrayLogs:(NSInteger)logs;
+ (BOOL)clearDiskCacheExceptVideoUrlArrayLogs:(NSInteger)logs;
+ (BOOL)diskCacheSizeLogs:(NSInteger)logs;
+ (BOOL)filePathsWithFileUrlArrayVideotypeLogs:(NSInteger)logs;
+ (BOOL)allFilePathWithDirectoryPathLogs:(NSInteger)logs;
+ (BOOL)createBaseDirectoryAtPathLogs:(NSInteger)logs;
+ (BOOL)addDoNotBackupAttributeLogs:(NSInteger)logs;
+ (BOOL)md5StringLogs:(NSInteger)logs;
+ (BOOL)videoNameWithURLLogs:(NSInteger)logs;
+ (BOOL)keyWithURLLogs:(NSInteger)logs;

@end
