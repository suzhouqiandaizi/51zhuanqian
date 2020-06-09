#import "UIImage+GIFLogs.h"
@implementation UIImage (GIFLogs)
+ (BOOL)sd_animatedGIFWithDataLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)isGIFLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
