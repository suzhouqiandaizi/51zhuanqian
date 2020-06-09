#import "logsSJVideoPlayerURLAssetA.h"
@implementation logsSJVideoPlayerURLAssetA
+ (BOOL)bSetsubtitles:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)Nsubtitles:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
