#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+HighlightedWebCache.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"

@interface UIImageView (HighlightedWebCacheLogs)
+ (BOOL)sd_setHighlightedImageWithURLLogs:(NSInteger)logs;
+ (BOOL)sd_setHighlightedImageWithURLOptionsLogs:(NSInteger)logs;
+ (BOOL)sd_setHighlightedImageWithURLCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setHighlightedImageWithURLOptionsCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setHighlightedImageWithURLOptionsProgressCompletedLogs:(NSInteger)logs;

@end
