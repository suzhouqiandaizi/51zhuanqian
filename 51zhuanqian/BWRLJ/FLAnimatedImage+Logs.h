#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface FLAnimatedImage (Logs)
+ (BOOL)frameCacheSizeCurrentLogs:(NSInteger)logs;
+ (BOOL)setFrameCacheSizeMaxLogs:(NSInteger)logs;
+ (BOOL)setFrameCacheSizeMaxInternalLogs:(NSInteger)logs;
+ (BOOL)initializeLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithAnimatedGIFDataLogs:(NSInteger)logs;
+ (BOOL)initWithAnimatedGIFDataOptimalframecachesizePredrawingenabledLogs:(NSInteger)logs;
+ (BOOL)animatedImageWithGIFDataLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)imageLazilyCachedAtIndexLogs:(NSInteger)logs;
+ (BOOL)addFrameIndexesToCacheLogs:(NSInteger)logs;
+ (BOOL)sizeForImageLogs:(NSInteger)logs;
+ (BOOL)imageAtIndexLogs:(NSInteger)logs;
+ (BOOL)frameIndexesToCacheLogs:(NSInteger)logs;
+ (BOOL)purgeFrameCacheIfNeededLogs:(NSInteger)logs;
+ (BOOL)growFrameCacheSizeAfterMemoryWarningLogs:(NSInteger)logs;
+ (BOOL)resetFrameCacheSizeMaxInternalLogs:(NSInteger)logs;
+ (BOOL)didReceiveMemoryWarningLogs:(NSInteger)logs;
+ (BOOL)predrawnImageFromImageLogs:(NSInteger)logs;
+ (BOOL)descriptionLogs:(NSInteger)logs;

@end
