#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"

@interface UIImageView (WebCacheLogs)
+ (BOOL)sd_setImageWithURLLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithPreviousCachedImageWithURLPlaceholderimageOptionsProgressCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setAnimationImagesWithURLsLogs:(NSInteger)logs;
+ (BOOL)sd_cancelCurrentAnimationImagesLoadLogs:(NSInteger)logs;

@end
