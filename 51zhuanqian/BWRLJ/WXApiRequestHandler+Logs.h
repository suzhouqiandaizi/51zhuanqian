#import <Foundation/Foundation.h>
#import "WXApiObject.h"
#import "WXApi.h"
#import "WXApiRequestHandler.h"
#import "WXApiManager.h"
#import "SendMessageToWXReq+requestWithTextOrMediaMessage.h"
#import "WXMediaMessage+messageConstruct.h"

@interface WXApiRequestHandler (Logs)
+ (BOOL)sendTextInsceneLogs:(NSInteger)logs;
+ (BOOL)sendImageDataTagnameMessageextActionThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)sendLinkURLTagnameTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)sendMusicURLDataurlTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)sendVideoURLTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)sendEmotionDataThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)sendFileDataFileextensionTitleDescriptionThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)sendAppContentDataExtinfoExturlTitleDescriptionMessageextMessageactionThumbimageInsceneLogs:(NSInteger)logs;
+ (BOOL)addCardsToCardPackageLogs:(NSInteger)logs;
+ (BOOL)sendAuthRequestScopeStateOpenidInviewcontrollerLogs:(NSInteger)logs;
+ (BOOL)jumpToBizWebviewWithAppIDDescriptionTousrnameExtmsgLogs:(NSInteger)logs;
+ (BOOL)jumpToBizPayLogs:(NSInteger)logs;

@end
