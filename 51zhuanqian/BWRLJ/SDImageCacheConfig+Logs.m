#import "SDImageCacheConfig+Logs.h"
@implementation SDImageCacheConfig (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
