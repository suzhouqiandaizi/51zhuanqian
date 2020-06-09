#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface FLWeakProxy (Logs)
+ (BOOL)weakProxyForObjectLogs:(NSInteger)logs;
+ (BOOL)forwardingTargetForSelectorLogs:(NSInteger)logs;
+ (BOOL)forwardInvocationLogs:(NSInteger)logs;
+ (BOOL)methodSignatureForSelectorLogs:(NSInteger)logs;

@end
