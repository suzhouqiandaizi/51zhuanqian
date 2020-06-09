#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHLaunchAdDownloader.h"
#import "XHLaunchAdImageManager.h"
#import "XHLaunchAdCache.h"

@interface XHLaunchAdImageManager (Logs)
+ (BOOL)sharedManagerLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)loadImageWithURLOptionsProgressCompletedLogs:(NSInteger)logs;

@end
