#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface FLAnimatedImage (LoggingLogs)
+ (BOOL)setLogBlockLoglevelLogs:(NSInteger)logs;
+ (BOOL)logStringFromBlockWithlevelLogs:(NSInteger)logs;

@end
