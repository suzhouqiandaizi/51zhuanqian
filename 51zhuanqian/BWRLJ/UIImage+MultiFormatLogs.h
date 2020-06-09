#import "SDWebImageCompat.h"
#import "NSData+ImageContentType.h"
#import "UIImage+MultiFormat.h"
#import "UIImage+GIF.h"
#import "NSData+ImageContentType.h"
#import <ImageIO/ImageIO.h>
#import "UIImage+WebP.h"

@interface UIImage (MultiFormatLogs)
+ (BOOL)sd_imageWithDataLogs:(NSInteger)logs;
+ (BOOL)sd_imageOrientationFromImageDataLogs:(NSInteger)logs;
+ (BOOL)sd_exifOrientationToiOSOrientationLogs:(NSInteger)logs;
+ (BOOL)sd_imageDataLogs:(NSInteger)logs;
+ (BOOL)sd_imageDataAsFormatLogs:(NSInteger)logs;

@end
