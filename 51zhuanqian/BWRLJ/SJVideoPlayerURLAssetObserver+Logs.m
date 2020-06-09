#import "SJVideoPlayerURLAssetObserver+Logs.h"
@implementation SJVideoPlayerURLAssetObserver (Logs)
+ (BOOL)initWithAssetLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
