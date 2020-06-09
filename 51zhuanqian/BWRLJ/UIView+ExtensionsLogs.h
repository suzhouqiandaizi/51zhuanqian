#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>
#import "UIView+Extensions.h"

@interface UIView (ExtensionsLogs)
+ (BOOL)originLogs:(NSInteger)logs;
+ (BOOL)setOriginLogs:(NSInteger)logs;
+ (BOOL)sizeLogs:(NSInteger)logs;
+ (BOOL)setSizeLogs:(NSInteger)logs;
+ (BOOL)bottomRightLogs:(NSInteger)logs;
+ (BOOL)bottomLeftLogs:(NSInteger)logs;
+ (BOOL)topRightLogs:(NSInteger)logs;
+ (BOOL)heightLogs:(NSInteger)logs;
+ (BOOL)setHeightLogs:(NSInteger)logs;
+ (BOOL)widthLogs:(NSInteger)logs;
+ (BOOL)setWidthLogs:(NSInteger)logs;
+ (BOOL)topLogs:(NSInteger)logs;
+ (BOOL)setTopLogs:(NSInteger)logs;
+ (BOOL)leftLogs:(NSInteger)logs;
+ (BOOL)setLeftLogs:(NSInteger)logs;
+ (BOOL)bottomLogs:(NSInteger)logs;
+ (BOOL)setBottomLogs:(NSInteger)logs;
+ (BOOL)rightLogs:(NSInteger)logs;
+ (BOOL)setRightLogs:(NSInteger)logs;

@end
