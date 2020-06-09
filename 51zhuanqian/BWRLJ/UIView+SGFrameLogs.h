#import <UIKit/UIKit.h>
#import "UIView+SGFrame.h"

@interface UIView (SGFrameLogs)
+ (BOOL)setSG_xLogs:(NSInteger)logs;
+ (BOOL)SG_xLogs:(NSInteger)logs;
+ (BOOL)setSG_yLogs:(NSInteger)logs;
+ (BOOL)SG_yLogs:(NSInteger)logs;
+ (BOOL)setSG_widthLogs:(NSInteger)logs;
+ (BOOL)SG_widthLogs:(NSInteger)logs;
+ (BOOL)setSG_heightLogs:(NSInteger)logs;
+ (BOOL)SG_heightLogs:(NSInteger)logs;
+ (BOOL)SG_centerXLogs:(NSInteger)logs;
+ (BOOL)setSG_centerXLogs:(NSInteger)logs;
+ (BOOL)SG_centerYLogs:(NSInteger)logs;
+ (BOOL)setSG_centerYLogs:(NSInteger)logs;
+ (BOOL)setSG_originLogs:(NSInteger)logs;
+ (BOOL)SG_originLogs:(NSInteger)logs;
+ (BOOL)setSG_sizeLogs:(NSInteger)logs;
+ (BOOL)SG_sizeLogs:(NSInteger)logs;
+ (BOOL)SG_loadViewFromXibLogs:(NSInteger)logs;

@end
