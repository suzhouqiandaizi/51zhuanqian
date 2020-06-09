#import <Foundation/Foundation.h>
#import "XNBase64.h"
#import <Availability.h>

@interface NSData (XNBase64Logs)
+ (BOOL)dataWithBase64EncodedStringLogs:(NSInteger)logs;
+ (BOOL)base64EncodedStringWithWrapWidthLogs:(NSInteger)logs;
+ (BOOL)base64EncodedStringLogs:(NSInteger)logs;

@end
