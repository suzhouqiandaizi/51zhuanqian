#import "NSData+ImageContentTypeLogs.h"
@implementation NSData (ImageContentTypeLogs)
+ (BOOL)sd_imageFormatForImageDataLogs:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
