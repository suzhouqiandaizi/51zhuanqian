#import "SJAVMediaPlayerDefinitionLoader+Logs.h"
@implementation SJAVMediaPlayerDefinitionLoader (Logs)
+ (BOOL)initWithMediaDatasourceCompletionhandlerLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)_statusDidChangeLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)_seekToCurPosLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)_didCompleteLoadLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)cancelLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
