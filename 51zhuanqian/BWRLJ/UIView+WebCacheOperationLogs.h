#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIView+WebCacheOperation.h"
#import "objc/runtime.h"

@interface UIView (WebCacheOperationLogs)
+ (BOOL)operationDictionaryLogs:(NSInteger)logs;
+ (BOOL)sd_setImageLoadOperationForkeyLogs:(NSInteger)logs;
+ (BOOL)sd_cancelImageLoadOperationWithKeyLogs:(NSInteger)logs;
+ (BOOL)sd_removeImageLoadOperationWithKeyLogs:(NSInteger)logs;

@end
