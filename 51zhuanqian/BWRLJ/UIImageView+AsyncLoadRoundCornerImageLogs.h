#import <UIKit/UIKit.h>
#import "UIImageView+AsyncLoadImage.h"
#import <objc/message.h>
#import "SJAsyncLoader.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SJCornerMask.h"

@interface UIImageView (AsyncLoadRoundCornerImageLogs)
+ (BOOL)asyncLoadImageWithURLCornerradiusCornersBorderwidthBordercolorPlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)asyncLoadRoundedImageWithURLBorderwidthBordercolorPlaceholderimageLogs:(NSInteger)logs;

@end
