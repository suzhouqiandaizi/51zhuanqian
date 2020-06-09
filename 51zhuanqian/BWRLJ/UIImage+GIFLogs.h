#import "SDWebImageCompat.h"
#import "UIImage+GIF.h"
#import <ImageIO/ImageIO.h>
#import "objc/runtime.h"
#import "NSImage+WebCache.h"

@interface UIImage (GIFLogs)
+ (BOOL)sd_animatedGIFWithDataLogs:(NSInteger)logs;
+ (BOOL)isGIFLogs:(NSInteger)logs;

@end
