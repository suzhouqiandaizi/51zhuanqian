#import "SJAVBasePlayerItem+Logs.h"
@implementation SJAVBasePlayerItem (Logs)
+ (BOOL)initWithAssetLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)_initObservationsLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
