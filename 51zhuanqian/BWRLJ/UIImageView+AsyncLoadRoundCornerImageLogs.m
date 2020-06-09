#import "UIImageView+AsyncLoadRoundCornerImageLogs.h"
@implementation UIImageView (AsyncLoadRoundCornerImageLogs)
+ (BOOL)asyncLoadImageWithURLCornerradiusCornersBorderwidthBordercolorPlaceholderimageLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)asyncLoadRoundedImageWithURLBorderwidthBordercolorPlaceholderimageLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
