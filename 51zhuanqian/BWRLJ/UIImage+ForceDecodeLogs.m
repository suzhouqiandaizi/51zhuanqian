#import "UIImage+ForceDecodeLogs.h"
@implementation UIImage (ForceDecodeLogs)
+ (BOOL)decodedImageWithImageLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)decodedAndScaledDownImageWithImageLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)shouldDecodeImageLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)shouldScaleDownImageLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)colorSpaceForImageRefLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)decodedImageWithImageLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)decodedAndScaledDownImageWithImageLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
