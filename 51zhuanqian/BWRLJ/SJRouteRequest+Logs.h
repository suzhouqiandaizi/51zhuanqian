#import <Foundation/Foundation.h>
#import "SJRouteRequest.h"
#import <objc/message.h>

@interface SJRouteRequest (Logs)
+ (BOOL)initWithPathParametersLogs:(NSInteger)logs;
+ (BOOL)descriptionLogs:(NSInteger)logs;

@end
