#import "SDWebImageCompat.h"
#import <Cocoa/Cocoa.h>
#import "NSImage+WebCache.h"

@interface NSImage (WebCacheLogs)
+ (BOOL)CGImageLogs:(NSInteger)logs;
+ (BOOL)imagesLogs:(NSInteger)logs;
+ (BOOL)isGIFLogs:(NSInteger)logs;

@end
