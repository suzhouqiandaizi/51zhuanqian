#import "UIImage+ImageEffectsLogs.h"
@implementation UIImage (ImageEffectsLogs)
+ (BOOL)applySubtleEffectLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)applyLightEffectLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)applyExtraLightEffectLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)applyDarkEffectLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)applyTintEffectWithColorLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)applyBlurWithRadiusTintcolorSaturationdeltafactorMaskimageLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
