#import "UIImage+WebPLogs.h"
@implementation UIImage (WebPLogs)
+ (BOOL)sd_imageWithWebPDataLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)sd_blendWebpImageWithOriginImageIteratorLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)sd_rawWepImageWithDataLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
