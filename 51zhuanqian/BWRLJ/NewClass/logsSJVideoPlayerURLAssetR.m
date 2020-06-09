#import "logsSJVideoPlayerURLAssetR.h"
@implementation logsSJVideoPlayerURLAssetR
+ (BOOL)xInitwithavasset:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)HInitwithavassetNPlaymodel:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)PInitwithavassetuSpecifystarttimeEPlaymodel:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)FSetavasset:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)DavAsset:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
