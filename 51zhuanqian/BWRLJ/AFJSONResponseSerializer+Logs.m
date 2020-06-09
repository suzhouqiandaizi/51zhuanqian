#import "AFJSONResponseSerializer+Logs.h"
@implementation AFJSONResponseSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)serializerWithReadingOptionsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
