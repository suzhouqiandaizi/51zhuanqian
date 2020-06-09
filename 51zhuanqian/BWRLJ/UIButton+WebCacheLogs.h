#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIButton+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"

@interface UIButton (WebCacheLogs)
+ (BOOL)sd_currentImageURLLogs:(NSInteger)logs;
+ (BOOL)sd_imageURLForStateLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLForstateLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLForstatePlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLForstatePlaceholderimageOptionsLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLForstateCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLForstatePlaceholderimageCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLForstatePlaceholderimageOptionsCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageWithURLForstateLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageWithURLForstatePlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageWithURLForstatePlaceholderimageOptionsLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageWithURLForstateCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageWithURLForstatePlaceholderimageCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageWithURLForstatePlaceholderimageOptionsCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageLoadOperationForstateLogs:(NSInteger)logs;
+ (BOOL)sd_cancelImageLoadForStateLogs:(NSInteger)logs;
+ (BOOL)sd_setBackgroundImageLoadOperationForstateLogs:(NSInteger)logs;
+ (BOOL)sd_cancelBackgroundImageLoadForStateLogs:(NSInteger)logs;
+ (BOOL)imageURLStorageLogs:(NSInteger)logs;

@end
