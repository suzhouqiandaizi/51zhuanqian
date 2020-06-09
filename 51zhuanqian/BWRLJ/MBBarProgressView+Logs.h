#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "MBProgressHUD.h"
#import <tgmath.h>

@interface MBBarProgressView (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)intrinsicContentSizeLogs:(NSInteger)logs;
+ (BOOL)setProgressLogs:(NSInteger)logs;
+ (BOOL)setProgressColorLogs:(NSInteger)logs;
+ (BOOL)setProgressRemainingColorLogs:(NSInteger)logs;
+ (BOOL)drawRectLogs:(NSInteger)logs;

@end
