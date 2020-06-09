#import "logsUIImageY.h"
@implementation logsUIImageY
+ (BOOL)PSd_Imagewithdata:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)LSd_Imageorientationfromimagedata:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)rSd_Exiforientationtoiosorientation:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)Msd_imageData:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)wSd_Imagedataasformat:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
