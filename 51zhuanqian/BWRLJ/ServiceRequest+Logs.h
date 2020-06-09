#import <Foundation/Foundation.h>
#import "ServiceRequest.h"
#import "AFNetworking.h"
#import "XNBase64.h"
#import "AppDelegate.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"

@interface ServiceRequest (Logs)
+ (BOOL)sharedServiceLogs:(NSInteger)logs;
+ (BOOL)sharedHTTPSessionLogs:(NSInteger)logs;
+ (BOOL)sharedURLSessionLogs:(NSInteger)logs;
+ (BOOL)certDataLogs:(NSInteger)logs;
+ (BOOL)RequestMethodWithurlParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)RequestJsonMethodWithurlParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)GETParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)POSTParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)POSTCUSTOMParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)PUTParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)PUTJSONParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)DELETEParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)DELETEJSONParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)POSTJSONParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)POSTJSONParametersSuccessFailureUpdateLogs:(NSInteger)logs;
+ (BOOL)PUTJSONParametersSuccessFailureUpdateLogs:(NSInteger)logs;
+ (BOOL)GETLoginParametersSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)cancelDataTaskForKeyLogs:(NSInteger)logs;
+ (BOOL)showErrorAndresponseAndresponseobjectFailureLogs:(NSInteger)logs;

@end
