#import <Foundation/Foundation.h>
#import "SJPlaybackListControllerProtocol.h"
#import "SJPlaybackListControllerObserver.h"

@interface SJPlaybackListControllerObserver (Logs)
+ (BOOL)initWithListControllerLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;

@end
