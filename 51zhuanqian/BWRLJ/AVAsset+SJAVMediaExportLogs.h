#import <AVFoundation/AVFoundation.h>
#import "AVAsset+SJAVMediaExport.h"
#import <objc/message.h>
#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "NSTimer+SJAssetAdd.h"

@interface AVAsset (SJAVMediaExportLogs)
+ (BOOL)sj_imagesGeneratorLogs:(NSInteger)logs;
+ (BOOL)sj_generatePreviewImagesWithMaxItemSizeCountCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)sj_cancelGeneratePreviewImagesLogs:(NSInteger)logs;
+ (BOOL)sj_assetExporterLogs:(NSInteger)logs;
+ (BOOL)sj_exportWithStartTimeDurationTofilePresetnameProgressSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)sj_cancelExportOperationLogs:(NSInteger)logs;
+ (BOOL)sj_screenshotGeneratorLogs:(NSInteger)logs;
+ (BOOL)sj_screenshotWithTimeLogs:(NSInteger)logs;
+ (BOOL)sj_screenshotWithTimeCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)sj_screenshotWithTimeSizeCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)sj_cancelScreenshotOperationLogs:(NSInteger)logs;
+ (BOOL)sj_GIFGeneratorLogs:(NSInteger)logs;
+ (BOOL)sj_generateGIFWithBeginTimeDurationImagemaxsizeIntervalTofileProgressSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)sj_cancelGenerateGIFOperationLogs:(NSInteger)logs;

@end
