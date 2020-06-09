#import "AFHTTPResponseSerializer+Logs.h"
@implementation AFHTTPResponseSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)validateResponseDataErrorLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)supportsSecureCodingLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
