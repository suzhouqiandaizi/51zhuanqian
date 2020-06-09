#import "NSTimer+SJAssetAddLogs.h"
@implementation NSTimer (SJAssetAddLogs)
+ (BOOL)assetAdd_timerWithTimeIntervalBlockRepeatsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)assetAdd_exeBlockLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)assetAdd_fireLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
