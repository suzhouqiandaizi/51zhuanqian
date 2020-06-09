#import <UIKit/UIKit.h>
#import "SJPlayerView.h"
#import "SJBaseVideoPlayerConst.h"

@interface SJPlayerView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)hitTestWitheventLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)willMoveToWindowLogs:(NSInteger)logs;

@end
