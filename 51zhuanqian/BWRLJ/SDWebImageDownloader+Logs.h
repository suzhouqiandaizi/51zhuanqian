#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"
#import "SDWebImageOperation.h"
#import "SDWebImageDownloader.h"
#import "SDWebImageDownloaderOperation.h"
#import <ImageIO/ImageIO.h>

@interface SDWebImageDownloader (Logs)
+ (BOOL)initializeLogs:(NSInteger)logs;
+ (BOOL)sharedDownloaderLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithSessionConfigurationLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)setValueForhttpheaderfieldLogs:(NSInteger)logs;
+ (BOOL)valueForHTTPHeaderFieldLogs:(NSInteger)logs;
+ (BOOL)setMaxConcurrentDownloadsLogs:(NSInteger)logs;
+ (BOOL)currentDownloadCountLogs:(NSInteger)logs;
+ (BOOL)maxConcurrentDownloadsLogs:(NSInteger)logs;
+ (BOOL)setOperationClassLogs:(NSInteger)logs;
+ (BOOL)downloadImageWithURLOptionsProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;
+ (BOOL)addProgressCallbackCompletedblockForurlCreatecallbackLogs:(NSInteger)logs;
+ (BOOL)setSuspendedLogs:(NSInteger)logs;
+ (BOOL)cancelAllDownloadsLogs:(NSInteger)logs;
+ (BOOL)operationWithTaskLogs:(NSInteger)logs;
+ (BOOL)URLSessionDatataskDidreceiveresponseCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)URLSessionDatataskDidreceivedataLogs:(NSInteger)logs;
+ (BOOL)URLSessionDatataskWillcacheresponseCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)URLSessionTaskDidcompletewitherrorLogs:(NSInteger)logs;
+ (BOOL)URLSessionTaskWillperformhttpredirectionNewrequestCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)URLSessionTaskDidreceivechallengeCompletionhandlerLogs:(NSInteger)logs;

@end
