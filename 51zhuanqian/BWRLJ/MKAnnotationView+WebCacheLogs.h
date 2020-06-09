#import "SDWebImageCompat.h"
#import <MapKit/MapKit.h>
#import "SDWebImageManager.h"
#import "MKAnnotationView+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"

@interface MKAnnotationView (WebCacheLogs)
+ (BOOL)sd_setImageWithURLLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageCompletedLogs:(NSInteger)logs;
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsCompletedLogs:(NSInteger)logs;

@end
