#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"
#import <float.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (ImageEffectsLogs)
+ (BOOL)applySubtleEffectLogs:(NSInteger)logs;
+ (BOOL)applyLightEffectLogs:(NSInteger)logs;
+ (BOOL)applyExtraLightEffectLogs:(NSInteger)logs;
+ (BOOL)applyDarkEffectLogs:(NSInteger)logs;
+ (BOOL)applyTintEffectWithColorLogs:(NSInteger)logs;
+ (BOOL)applyBlurWithRadiusTintcolorSaturationdeltafactorMaskimageLogs:(NSInteger)logs;

@end
