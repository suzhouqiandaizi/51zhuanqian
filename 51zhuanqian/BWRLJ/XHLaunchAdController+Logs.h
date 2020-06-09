#import <UIKit/UIKit.h>
#import "XHLaunchAdController.h"
#import "XHLaunchAdConst.h"

@interface XHLaunchAdController (Logs)
+ (BOOL)shouldAutorotateLogs:(NSInteger)logs;
+ (BOOL)prefersHomeIndicatorAutoHiddenLogs:(NSInteger)logs;

@end
