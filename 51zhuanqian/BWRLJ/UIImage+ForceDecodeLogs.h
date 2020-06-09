#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"
#import "SDWebImageDecoder.h"

@interface UIImage (ForceDecodeLogs)
+ (BOOL)decodedImageWithImageLogs:(NSInteger)logs;
+ (BOOL)decodedAndScaledDownImageWithImageLogs:(NSInteger)logs;
+ (BOOL)shouldDecodeImageLogs:(NSInteger)logs;
+ (BOOL)shouldScaleDownImageLogs:(NSInteger)logs;
+ (BOOL)colorSpaceForImageRefLogs:(NSInteger)logs;
+ (BOOL)decodedImageWithImageLogs:(NSInteger)logs;
+ (BOOL)decodedAndScaledDownImageWithImageLogs:(NSInteger)logs;

@end
