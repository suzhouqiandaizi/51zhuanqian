#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import "AFURLRequestSerialization.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreServices/CoreServices.h>

@interface AFHTTPRequestSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)setAllowsCellularAccessLogs:(NSInteger)logs;
+ (BOOL)setCachePolicyLogs:(NSInteger)logs;
+ (BOOL)setHTTPShouldHandleCookiesLogs:(NSInteger)logs;
+ (BOOL)setHTTPShouldUsePipeliningLogs:(NSInteger)logs;
+ (BOOL)setNetworkServiceTypeLogs:(NSInteger)logs;
+ (BOOL)setTimeoutIntervalLogs:(NSInteger)logs;
+ (BOOL)HTTPRequestHeadersLogs:(NSInteger)logs;
+ (BOOL)setValueForhttpheaderfieldLogs:(NSInteger)logs;
+ (BOOL)valueForHTTPHeaderFieldLogs:(NSInteger)logs;
+ (BOOL)setAuthorizationHeaderFieldWithUsernamePasswordLogs:(NSInteger)logs;
+ (BOOL)clearAuthorizationHeaderLogs:(NSInteger)logs;
+ (BOOL)setQueryStringSerializationWithStyleLogs:(NSInteger)logs;
+ (BOOL)setQueryStringSerializationWithBlockLogs:(NSInteger)logs;
+ (BOOL)requestWithMethodUrlstringParametersErrorLogs:(NSInteger)logs;
+ (BOOL)multipartFormRequestWithMethodUrlstringParametersConstructingbodywithblockErrorLogs:(NSInteger)logs;
+ (BOOL)requestWithMultipartFormRequestWritingstreamcontentstofileCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)requestBySerializingRequestWithparametersErrorLogs:(NSInteger)logs;
+ (BOOL)automaticallyNotifiesObserversForKeyLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;
+ (BOOL)supportsSecureCodingLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs;
+ (BOOL)copyWithZoneLogs:(NSInteger)logs;

@end
