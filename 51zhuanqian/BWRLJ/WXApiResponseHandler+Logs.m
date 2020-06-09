#import "WXApiResponseHandler+Logs.h"
@implementation WXApiResponseHandler (Logs)
+ (BOOL)respTextLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)respImageDataMessageextActionThumbimageLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)respLinkURLTitleDescriptionThumbimageLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)respMusicURLDataurlTitleDescriptionThumbimageLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)respVideoURLTitleDescriptionThumbimageLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)respEmotionDataThumbimageLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)respFileDataFileextensionTitleDescriptionThumbimageLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)respAppContentDataExtinfoExturlTitleDescriptionMessageextMessageactionThumbimageLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
