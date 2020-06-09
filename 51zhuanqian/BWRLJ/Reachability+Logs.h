#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

@interface Reachability (Logs)
+ (BOOL)reachabilityWithHostNameLogs:(NSInteger)logs;
+ (BOOL)reachabilityWithHostnameLogs:(NSInteger)logs;
+ (BOOL)reachabilityWithAddressLogs:(NSInteger)logs;
+ (BOOL)reachabilityForInternetConnectionLogs:(NSInteger)logs;
+ (BOOL)reachabilityForLocalWiFiLogs:(NSInteger)logs;
+ (BOOL)initWithReachabilityRefLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)startNotifierLogs:(NSInteger)logs;
+ (BOOL)stopNotifierLogs:(NSInteger)logs;
+ (BOOL)isReachableWithFlagsLogs:(NSInteger)logs;
+ (BOOL)isReachableLogs:(NSInteger)logs;
+ (BOOL)isReachableViaWWANLogs:(NSInteger)logs;
+ (BOOL)isReachableViaWiFiLogs:(NSInteger)logs;
+ (BOOL)isConnectionRequiredLogs:(NSInteger)logs;
+ (BOOL)connectionRequiredLogs:(NSInteger)logs;
+ (BOOL)isConnectionOnDemandLogs:(NSInteger)logs;
+ (BOOL)isInterventionRequiredLogs:(NSInteger)logs;
+ (BOOL)currentReachabilityStatusLogs:(NSInteger)logs;
+ (BOOL)reachabilityFlagsLogs:(NSInteger)logs;
+ (BOOL)currentReachabilityStringLogs:(NSInteger)logs;
+ (BOOL)currentReachabilityFlagsLogs:(NSInteger)logs;
+ (BOOL)reachabilityChangedLogs:(NSInteger)logs;
+ (BOOL)descriptionLogs:(NSInteger)logs;

@end
