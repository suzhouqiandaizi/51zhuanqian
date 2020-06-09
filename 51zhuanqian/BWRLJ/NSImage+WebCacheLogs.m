#import "NSImage+WebCacheLogs.h"
@implementation NSImage (WebCacheLogs)
+ (BOOL)CGImageLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)imagesLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)isGIFLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
