#import "SJAVMediaPlayerLoader+Logs.h"
@implementation SJAVMediaPlayerLoader (Logs)
+ (BOOL)loadPlayerForMediaLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)clearPlayerForMediaLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
