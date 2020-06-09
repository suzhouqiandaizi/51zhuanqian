#import "UIImage+MultiFormatLogs.h"
@implementation UIImage (MultiFormatLogs)
+ (BOOL)sd_imageWithDataLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)sd_imageOrientationFromImageDataLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)sd_exifOrientationToiOSOrientationLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)sd_imageDataLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)sd_imageDataAsFormatLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
