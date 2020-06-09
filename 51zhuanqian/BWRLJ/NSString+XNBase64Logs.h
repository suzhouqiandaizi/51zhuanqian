#import <Foundation/Foundation.h>
#import "XNBase64.h"
#import <Availability.h>

@interface NSString (XNBase64Logs)
+ (BOOL)stringWithBase64EncodedStringLogs:(NSInteger)logs;
+ (BOOL)base64EncodedStringWithWrapWidthLogs:(NSInteger)logs;
+ (BOOL)base64EncodedStringLogs:(NSInteger)logs;
+ (BOOL)base64DecodedStringLogs:(NSInteger)logs;
+ (BOOL)base64DecodedDataLogs:(NSInteger)logs;

@end
