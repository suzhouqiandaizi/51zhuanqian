#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "AFNetworkReachabilityManager.h"
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

@interface AFNetworkReachabilityManager (Logs)
+ (BOOL)sharedManagerLogs:(NSInteger)logs;
+ (BOOL)managerForDomainLogs:(NSInteger)logs;
+ (BOOL)managerForAddressLogs:(NSInteger)logs;
+ (BOOL)managerLogs:(NSInteger)logs;
+ (BOOL)initWithReachabilityLogs:(NSInteger)logs;
+ (BOOL)init NS_UNAVAILABLELogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)isReachableLogs:(NSInteger)logs;
+ (BOOL)isReachableViaWWANLogs:(NSInteger)logs;
+ (BOOL)isReachableViaWiFiLogs:(NSInteger)logs;
+ (BOOL)startMonitoringLogs:(NSInteger)logs;
+ (BOOL)stopMonitoringLogs:(NSInteger)logs;
+ (BOOL)localizedNetworkReachabilityStatusStringLogs:(NSInteger)logs;
+ (BOOL)setReachabilityStatusChangeBlockLogs:(NSInteger)logs;
+ (BOOL)keyPathsForValuesAffectingValueForKeyLogs:(NSInteger)logs;

@end
