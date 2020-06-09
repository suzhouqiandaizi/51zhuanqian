#import <UIKit/UIKit.h>
#import "SJVideoPlayerRegistrar.h"
#import <AVFoundation/AVFoundation.h>
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import "NSObject+SJObserverHelper.h"

@interface SJVideoPlayerRegistrar (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)stateLogs:(NSInteger)logs;

@end
