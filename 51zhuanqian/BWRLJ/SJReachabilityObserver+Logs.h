#import <Foundation/Foundation.h>
#import "SJReachabilityDefines.h"
#import "SJReachability.h"
#import "NSTimer+SJAssetAdd.h"
#import "Reachability.h"
#import "Reachability.h"

@interface SJReachabilityObserver (Logs)
+ (BOOL)initWithReachabilityLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)networkStatusDidChangeLogs:(NSInteger)logs;
+ (BOOL)networkSpeedDidChangeLogs:(NSInteger)logs;

@end
