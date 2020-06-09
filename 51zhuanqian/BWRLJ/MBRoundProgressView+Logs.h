#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "MBProgressHUD.h"
#import <tgmath.h>

@interface MBRoundProgressView (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)intrinsicContentSizeLogs:(NSInteger)logs;
+ (BOOL)setProgressLogs:(NSInteger)logs;
+ (BOOL)setProgressTintColorLogs:(NSInteger)logs;
+ (BOOL)setBackgroundTintColorLogs:(NSInteger)logs;
+ (BOOL)drawRectLogs:(NSInteger)logs;

@end
