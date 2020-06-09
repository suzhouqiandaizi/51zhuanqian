#import "AVAsset+SJAVMediaExportLogs.h"
@implementation AVAsset (SJAVMediaExportLogs)
+ (BOOL)sj_imagesGeneratorLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)sj_generatePreviewImagesWithMaxItemSizeCountCompletionhandlerLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)sj_cancelGeneratePreviewImagesLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)sj_assetExporterLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)sj_exportWithStartTimeDurationTofilePresetnameProgressSuccessFailureLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)sj_cancelExportOperationLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)sj_screenshotGeneratorLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)sj_screenshotWithTimeLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)sj_screenshotWithTimeCompletionhandlerLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)sj_screenshotWithTimeSizeCompletionhandlerLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)sj_cancelScreenshotOperationLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)sj_GIFGeneratorLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)sj_generateGIFWithBeginTimeDurationImagemaxsizeIntervalTofileProgressSuccessFailureLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)sj_cancelGenerateGIFOperationLogs:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
