#import "logsSDImageCacheConfigE.h"
@implementation logsSDImageCacheConfigE
+ (BOOL)rinit:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
