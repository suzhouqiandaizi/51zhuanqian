#import <UIKit/UIKit.h>
#import "UIView+SDExtension.h"

@interface UIView (SDExtensionLogs)
+ (BOOL)sd_heightLogs:(NSInteger)logs;
+ (BOOL)setSd_heightLogs:(NSInteger)logs;
+ (BOOL)sd_widthLogs:(NSInteger)logs;
+ (BOOL)setSd_widthLogs:(NSInteger)logs;
+ (BOOL)sd_yLogs:(NSInteger)logs;
+ (BOOL)setSd_yLogs:(NSInteger)logs;
+ (BOOL)sd_xLogs:(NSInteger)logs;
+ (BOOL)setSd_xLogs:(NSInteger)logs;

@end
