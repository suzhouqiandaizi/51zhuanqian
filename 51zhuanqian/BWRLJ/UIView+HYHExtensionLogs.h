#import <UIKit/UIKit.h>
#import "UIView+HYHExtension.h"

@interface UIView (HYHExtensionLogs)
+ (BOOL)yh_xLogs:(NSInteger)logs;
+ (BOOL)setYh_xLogs:(NSInteger)logs;
+ (BOOL)yh_yLogs:(NSInteger)logs;
+ (BOOL)setYh_yLogs:(NSInteger)logs;
+ (BOOL)setYh_widthLogs:(NSInteger)logs;
+ (BOOL)yh_widthLogs:(NSInteger)logs;
+ (BOOL)setYh_heightLogs:(NSInteger)logs;
+ (BOOL)yh_heightLogs:(NSInteger)logs;
+ (BOOL)yh_sizeLogs:(NSInteger)logs;
+ (BOOL)setYh_sizeLogs:(NSInteger)logs;
+ (BOOL)yh_originLogs:(NSInteger)logs;
+ (BOOL)setYh_originLogs:(NSInteger)logs;

@end
