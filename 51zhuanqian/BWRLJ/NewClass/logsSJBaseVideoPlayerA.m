#import "logsSJBaseVideoPlayerA.h"
@implementation logsSJBaseVideoPlayerA
+ (BOOL)YshowLog_TimeControlStatus:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)pshowLog_AssetStatus:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
