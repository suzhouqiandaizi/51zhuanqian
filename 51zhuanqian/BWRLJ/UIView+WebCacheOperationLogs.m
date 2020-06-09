#import "UIView+WebCacheOperationLogs.h"
@implementation UIView (WebCacheOperationLogs)
+ (BOOL)operationDictionaryLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)sd_setImageLoadOperationForkeyLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)sd_cancelImageLoadOperationWithKeyLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)sd_removeImageLoadOperationWithKeyLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
