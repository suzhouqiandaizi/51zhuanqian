#import <UIKit/UIKit.h>
#import "UIImageView+AsyncLoadImage.h"
#import <objc/message.h>
#import "SJAsyncLoader.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SJCornerMask.h"

@interface UIImageView (AsyncLoadImageLogs)
+ (BOOL)imageViewWithAsyncLoadImageLogs:(NSInteger)logs;
+ (BOOL)imageViewWithAsyncLoadImageViewmodeLogs:(NSInteger)logs;
+ (BOOL)imageViewWithAsyncLoadImageViewmodeBackgroundcolorLogs:(NSInteger)logs;
+ (BOOL)imageViewWithAsyncLoadImageViewmodePlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)asyncLoadImageLogs:(NSInteger)logs;
+ (BOOL)asyncLoadImagePlaceholderimageLogs:(NSInteger)logs;

@end
