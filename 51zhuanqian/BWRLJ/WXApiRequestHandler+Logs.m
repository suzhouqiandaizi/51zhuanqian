#import "WXApiRequestHandler+Logs.h"
@implementation WXApiRequestHandler (Logs)
+ (BOOL)sendTextInsceneLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)sendImageDataTagnameMessageextActionThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)sendLinkURLTagnameTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)sendMusicURLDataurlTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)sendVideoURLTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)sendEmotionDataThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)sendFileDataFileextensionTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)sendAppContentDataExtinfoExturlTitleDescriptionMessageextMessageactionThumbimageInsceneLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)addCardsToCardPackageLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)sendAuthRequestScopeStateOpenidInviewcontrollerLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)jumpToBizWebviewWithAppIDDescriptionTousrnameExtmsgLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)jumpToBizPayLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
