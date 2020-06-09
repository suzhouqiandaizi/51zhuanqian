#import <Foundation/Foundation.h>
#import "SJReachabilityDefines.h"
#import "SJReachability.h"
#import "NSTimer+SJAssetAdd.h"
#import "Reachability.h"
#import "Reachability.h"

@interface SJReachability (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)networkSpeedStrLogs:(NSInteger)logs;
+ (BOOL)_initializeReachabilityLogs:(NSInteger)logs;
+ (BOOL)reachabilityChangedLogs:(NSInteger)logs;
+ (BOOL)_updateNetworkStatusLogs:(NSInteger)logs;
+ (BOOL)_initializeSpeedObserverLogs:(NSInteger)logs;
+ (BOOL)startRefreshLogs:(NSInteger)logs;
+ (BOOL)stopRefreshLogs:(NSInteger)logs;
+ (BOOL)setNetworkStatusLogs:(NSInteger)logs;

@end
