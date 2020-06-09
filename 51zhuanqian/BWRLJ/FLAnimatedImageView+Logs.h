#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import <QuartzCore/QuartzCore.h>

@interface FLAnimatedImageView (Logs)
+ (BOOL)initWithImageLogs:(NSInteger)logs;
+ (BOOL)initWithImageHighlightedimageLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)commonInitLogs:(NSInteger)logs;
+ (BOOL)setAnimatedImageLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)didMoveToSuperviewLogs:(NSInteger)logs;
+ (BOOL)didMoveToWindowLogs:(NSInteger)logs;
+ (BOOL)setAlphaLogs:(NSInteger)logs;
+ (BOOL)setHiddenLogs:(NSInteger)logs;
+ (BOOL)intrinsicContentSizeLogs:(NSInteger)logs;
+ (BOOL)accessibilityIgnoresInvertColorsLogs:(NSInteger)logs;
+ (BOOL)imageLogs:(NSInteger)logs;
+ (BOOL)setImageLogs:(NSInteger)logs;
+ (BOOL)frameDelayGreatestCommonDivisorLogs:(NSInteger)logs;
+ (BOOL)startAnimatingLogs:(NSInteger)logs;
+ (BOOL)setRunLoopModeLogs:(NSInteger)logs;
+ (BOOL)stopAnimatingLogs:(NSInteger)logs;
+ (BOOL)isAnimatingLogs:(NSInteger)logs;
+ (BOOL)setHighlightedLogs:(NSInteger)logs;
+ (BOOL)updateShouldAnimateLogs:(NSInteger)logs;
+ (BOOL)displayDidRefreshLogs:(NSInteger)logs;
+ (BOOL)defaultRunLoopModeLogs:(NSInteger)logs;
+ (BOOL)displayLayerLogs:(NSInteger)logs;

@end
