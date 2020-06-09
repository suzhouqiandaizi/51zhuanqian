#import "XHLaunchAdView.h"
#import "XHLaunchAdImageManager.h"
#import "XHLaunchAdImageView+XHLaunchAdCache.h"
#import "FLAnimatedImage.h"
#import "XHLaunchAdConst.h"

@interface XHLaunchAdImageView (XHLaunchAdCacheLogs)
+ (BOOL)xh_setImageWithURLLogs:(NSInteger)logs;
+ (BOOL)xh_setImageWithURLPlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)xh_setImageWithURLPlaceholderimageOptionsLogs:(NSInteger)logs;
+ (BOOL)xh_setImageWithURLCompletedLogs:(NSInteger)logs;
+ (BOOL)xh_setImageWithURLPlaceholderimageCompletedLogs:(NSInteger)logs;
+ (BOOL)xh_setImageWithURLPlaceholderimageOptionsCompletedLogs:(NSInteger)logs;
+ (BOOL)xh_setImageWithURLPlaceholderimageGifimagecycleonceOptionsGifimagecycleoncefinishCompletedLogs:(NSInteger)logs;

@end
