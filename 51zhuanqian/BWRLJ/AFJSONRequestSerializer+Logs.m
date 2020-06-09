#import "AFJSONRequestSerializer+Logs.h"
@implementation AFJSONRequestSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)serializerWithWritingOptionsLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)requestBySerializingRequestWithparametersErrorLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
