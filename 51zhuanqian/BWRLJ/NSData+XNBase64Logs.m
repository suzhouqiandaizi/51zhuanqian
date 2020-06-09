#import "NSData+XNBase64Logs.h"
@implementation NSData (XNBase64Logs)
+ (BOOL)dataWithBase64EncodedStringLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)base64EncodedStringWithWrapWidthLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)base64EncodedStringLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
