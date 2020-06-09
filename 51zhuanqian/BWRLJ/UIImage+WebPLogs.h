#import "SDWebImageCompat.h"
#import "UIImage+WebP.h"
#import "webp/decode.h"
#import "webp/mux_types.h"
#import "webp/demux.h"
#import "NSImage+WebCache.h"

@interface UIImage (WebPLogs)
+ (BOOL)sd_imageWithWebPDataLogs:(NSInteger)logs;
+ (BOOL)sd_blendWebpImageWithOriginImageIteratorLogs:(NSInteger)logs;
+ (BOOL)sd_rawWepImageWithDataLogs:(NSInteger)logs;

@end
