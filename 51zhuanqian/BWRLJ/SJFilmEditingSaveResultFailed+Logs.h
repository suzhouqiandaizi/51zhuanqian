#import <Foundation/Foundation.h>
#import "SJFilmEditingSaveResultToAlbumHandler.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "SJVideoPlayerFilmEditingCommonHeader.h"
#import "SJFilmEditingSettings.h"

@interface SJFilmEditingSaveResultFailed (Logs)
+ (BOOL)initWithReasonLogs:(NSInteger)logs;
+ (BOOL)toStringLogs:(NSInteger)logs;

@end
