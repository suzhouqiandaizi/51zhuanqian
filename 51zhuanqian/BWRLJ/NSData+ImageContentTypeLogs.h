#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"
#import "NSData+ImageContentType.h"

@interface NSData (ImageContentTypeLogs)
+ (BOOL)sd_imageFormatForImageDataLogs:(NSInteger)logs;

@end
