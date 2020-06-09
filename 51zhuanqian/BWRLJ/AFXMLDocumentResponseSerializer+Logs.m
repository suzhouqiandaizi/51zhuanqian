#import "AFXMLDocumentResponseSerializer+Logs.h"
@implementation AFXMLDocumentResponseSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)serializerWithXMLDocumentOptionsLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
