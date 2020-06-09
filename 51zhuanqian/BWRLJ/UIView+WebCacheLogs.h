#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIView+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"

@interface UIView (WebCacheLogs)
+ (BOOL)sd_imageURLLogs:(NSInteger)logs;
+ (BOOL)sd_internalSetImageWithURLPlaceholderimageOptionsOperationkeySetimageblockProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_cancelCurrentImageLoadLogs:(NSInteger)logs;
+ (BOOL)sd_setImageImagedataBasedonclassorviacustomsetimageblockLogs:(NSInteger)logs;
+ (BOOL)sd_setNeedsLayoutLogs:(NSInteger)logs;
+ (BOOL)activityIndicatorLogs:(NSInteger)logs;
+ (BOOL)setActivityIndicatorLogs:(NSInteger)logs;
+ (BOOL)sd_setShowActivityIndicatorViewLogs:(NSInteger)logs;
+ (BOOL)sd_showActivityIndicatorViewLogs:(NSInteger)logs;
+ (BOOL)sd_setIndicatorStyleLogs:(NSInteger)logs;
+ (BOOL)sd_getIndicatorStyleLogs:(NSInteger)logs;
+ (BOOL)sd_addActivityIndicatorLogs:(NSInteger)logs;
+ (BOOL)sd_removeActivityIndicatorLogs:(NSInteger)logs;

@end
