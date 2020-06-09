#import <UIKit/UIKit.h>
#import "SJLoadingView.h"

@interface SJLoadingView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)intrinsicContentSizeLogs:(NSInteger)logs;
+ (BOOL)setLineWidthLogs:(NSInteger)logs;
+ (BOOL)setLineColorLogs:(NSInteger)logs;
+ (BOOL)lineColorLogs:(NSInteger)logs;
+ (BOOL)startLogs:(NSInteger)logs;
+ (BOOL)stopLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)gradientLayerLogs:(NSInteger)logs;
+ (BOOL)shapeLayerLogs:(NSInteger)logs;

@end
