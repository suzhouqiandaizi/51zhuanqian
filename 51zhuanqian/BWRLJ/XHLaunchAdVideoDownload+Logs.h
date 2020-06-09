#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHLaunchAdDownloader.h"
#import "XHLaunchAdCache.h"
#import "FLAnimatedImage.h"
#import "XHLaunchAdConst.h"

@interface XHLaunchAdVideoDownload (Logs)
+ (BOOL)initWithURLDelegatequeueProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)URLSessionDownloadtaskDidfinishdownloadingtourlLogs:(NSInteger)logs;
+ (BOOL)URLSessionDownloadtaskDidwritedataTotalbyteswrittenTotalbytesexpectedtowriteLogs:(NSInteger)logs;
+ (BOOL)URLSessionTaskDidcompletewitherrorLogs:(NSInteger)logs;

@end
