#import "AFImageResponseSerializer+Logs.h"
@implementation AFImageResponseSerializer (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
