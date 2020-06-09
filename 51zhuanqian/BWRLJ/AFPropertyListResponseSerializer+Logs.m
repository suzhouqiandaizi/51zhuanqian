#import "AFPropertyListResponseSerializer+Logs.h"
@implementation AFPropertyListResponseSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)serializerWithFormatReadoptionsLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
