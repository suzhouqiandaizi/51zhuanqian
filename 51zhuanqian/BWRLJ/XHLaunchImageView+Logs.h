#import <UIKit/UIKit.h>
#import "XHLaunchImageView.h"
#import "XHLaunchAdConst.h"

@interface XHLaunchImageView (Logs)
+ (BOOL)initWithSourceTypeLogs:(NSInteger)logs;
+ (BOOL)imageFromLaunchImageLogs:(NSInteger)logs;
+ (BOOL)imageFromLaunchScreenLogs:(NSInteger)logs;
+ (BOOL)imageFromViewLogs:(NSInteger)logs;
+ (BOOL)launchImageWithTypeLogs:(NSInteger)logs;

@end
