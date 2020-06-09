#import <UIKit/UIKit.h>
#import "SJFullscreenPopGesture.h"
#import <objc/message.h>
#import <WebKit/WebKit.h>

@interface UIViewController (_SJFullscreenPopGesturePrivateLogs)
+ (BOOL)setSj_previousViewControllerSnapshotLogs:(NSInteger)logs;
+ (BOOL)sj_previousViewControllerSnapshotLogs:(NSInteger)logs;

@end
