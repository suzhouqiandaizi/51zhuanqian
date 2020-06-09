#import <Foundation/Foundation.h>
#import "SJFilmEditingSaveResultToAlbumHandler.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "SJVideoPlayerFilmEditingCommonHeader.h"
#import "SJFilmEditingSettings.h"

@interface SJFilmEditingSaveResultToAlbumHandler (Logs)
+ (BOOL)saveResultCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)_saveScreenshotLogs:(NSInteger)logs;
+ (BOOL)_saveGIFLogs:(NSInteger)logs;
+ (BOOL)_saveVideoLogs:(NSInteger)logs;
+ (BOOL)videoDidfinishsavingwitherrorContextinfoLogs:(NSInteger)logs;
+ (BOOL)imageDidfinishsavingwitherrorContextinfoLogs:(NSInteger)logs;

@end
