#import <Foundation/Foundation.h>
#import "SDWebImageDownloader.h"
#import "SDWebImageOperation.h"
#import "SDWebImageDownloaderOperation.h"
#import "SDWebImageDecoder.h"
#import "UIImage+MultiFormat.h"
#import <ImageIO/ImageIO.h>
#import "SDWebImageManager.h"
#import "NSImage+WebCache.h"

@interface SDWebImageDownloaderOperation (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithRequestInsessionOptionsLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)addHandlersForProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)callbacksForKeyLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;
+ (BOOL)startLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;
+ (BOOL)cancelInternalLogs:(NSInteger)logs;
+ (BOOL)doneLogs:(NSInteger)logs;
+ (BOOL)resetLogs:(NSInteger)logs;
+ (BOOL)setFinishedLogs:(NSInteger)logs;
+ (BOOL)setExecutingLogs:(NSInteger)logs;
+ (BOOL)isConcurrentLogs:(NSInteger)logs;
+ (BOOL)URLSessionDatataskDidreceiveresponseCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)URLSessionDatataskDidreceivedataLogs:(NSInteger)logs;
+ (BOOL)URLSessionDatataskWillcacheresponseCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)URLSessionTaskDidcompletewitherrorLogs:(NSInteger)logs;
+ (BOOL)URLSessionTaskDidreceivechallengeCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)orientationFromPropertyValueLogs:(NSInteger)logs;
+ (BOOL)scaledImageForKeyImageLogs:(NSInteger)logs;
+ (BOOL)shouldContinueWhenAppEntersBackgroundLogs:(NSInteger)logs;
+ (BOOL)callCompletionBlocksWithErrorLogs:(NSInteger)logs;
+ (BOOL)callCompletionBlocksWithImageImagedataErrorFinishedLogs:(NSInteger)logs;

@end
