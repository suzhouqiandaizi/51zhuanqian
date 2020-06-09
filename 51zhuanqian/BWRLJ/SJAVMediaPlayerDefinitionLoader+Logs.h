#import "SJAVMediaPlayer.h"
#import "SJAVMediaPlayerDefinitionLoader.h"
#import "SJAVMediaPlayerLoader.h"
#import "SJAVMediaPresentView.h"
#import "SJAVMediaPresentController.h"

@interface SJAVMediaPlayerDefinitionLoader (Logs)
+ (BOOL)initWithMediaDatasourceCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)_statusDidChangeLogs:(NSInteger)logs;
+ (BOOL)_seekToCurPosLogs:(NSInteger)logs;
+ (BOOL)_didCompleteLoadLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;

@end
