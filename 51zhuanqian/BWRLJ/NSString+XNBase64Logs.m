#import "NSString+XNBase64Logs.h"
@implementation NSString (XNBase64Logs)
+ (BOOL)stringWithBase64EncodedStringLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)base64EncodedStringWithWrapWidthLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)base64EncodedStringLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)base64DecodedStringLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)base64DecodedDataLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
