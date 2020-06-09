#import "Order+Logs.h"
@implementation Order (Logs)
+ (BOOL)orderInfoEncodedLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)orderItemWithKeyAndvalueEncodedLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)encodeValueLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
