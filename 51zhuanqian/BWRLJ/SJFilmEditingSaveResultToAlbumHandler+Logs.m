#import "SJFilmEditingSaveResultToAlbumHandler+Logs.h"
@implementation SJFilmEditingSaveResultToAlbumHandler (Logs)
+ (BOOL)saveResultCompletionhandlerLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)_saveScreenshotLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)_saveGIFLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)_saveVideoLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)videoDidfinishsavingwitherrorContextinfoLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)imageDidfinishsavingwitherrorContextinfoLogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
