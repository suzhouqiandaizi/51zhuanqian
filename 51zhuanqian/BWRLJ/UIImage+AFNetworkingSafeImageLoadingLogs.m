#import "UIImage+AFNetworkingSafeImageLoadingLogs.h"
@implementation UIImage (AFNetworkingSafeImageLoadingLogs)
+ (BOOL)af_safeImageWithDataLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
