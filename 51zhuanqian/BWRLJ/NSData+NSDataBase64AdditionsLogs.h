#import <Foundation/Foundation.h>
#import "NSDataEx.h"

@interface NSData (NSDataBase64AdditionsLogs)
+ (BOOL)dataWithBase64EncodedStringLogs:(NSInteger)logs;
+ (BOOL)initWithBase64EncodedStringLogs:(NSInteger)logs;
+ (BOOL)base64EncodingLogs:(NSInteger)logs;
+ (BOOL)base64EncodingWithLineLengthLogs:(NSInteger)logs;

@end
