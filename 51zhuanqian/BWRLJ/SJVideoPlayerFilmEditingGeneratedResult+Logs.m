#import "SJVideoPlayerFilmEditingGeneratedResult+Logs.h"
@implementation SJVideoPlayerFilmEditingGeneratedResult (Logs)
+ (BOOL)dataLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)setExportStateLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)setExportProgressLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)setUploadStateLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)setUploadProgressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
