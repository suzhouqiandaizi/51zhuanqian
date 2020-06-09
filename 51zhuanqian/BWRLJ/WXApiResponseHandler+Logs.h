#import <Foundation/Foundation.h>
#import "WXApiObject.h"
#import "WXApi.h"
#import "WXApiResponseHandler.h"
#import "GetMessageFromWXResp+responseWithTextOrMediaMessage.h"
#import "WXMediaMessage+messageConstruct.h"

@interface WXApiResponseHandler (Logs)
+ (BOOL)respTextLogs:(NSInteger)logs;
+ (BOOL)respImageDataMessageextActionThumbimageLogs:(NSInteger)logs;
+ (BOOL)respLinkURLTitleDescriptionThumbimageLogs:(NSInteger)logs;
+ (BOOL)respMusicURLDataurlTitleDescriptionThumbimageLogs:(NSInteger)logs;
+ (BOOL)respVideoURLTitleDescriptionThumbimageLogs:(NSInteger)logs;
+ (BOOL)respEmotionDataThumbimageLogs:(NSInteger)logs;
+ (BOOL)respFileDataFileextensionTitleDescriptionThumbimageLogs:(NSInteger)logs;
+ (BOOL)respAppContentDataExtinfoExturlTitleDescriptionMessageextMessageactionThumbimageLogs:(NSInteger)logs;

@end
