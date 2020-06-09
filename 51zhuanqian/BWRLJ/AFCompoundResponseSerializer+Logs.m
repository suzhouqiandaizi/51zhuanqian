#import "AFCompoundResponseSerializer+Logs.h"
@implementation AFCompoundResponseSerializer (Logs)
+ (BOOL)compoundSerializerWithResponseSerializersLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
