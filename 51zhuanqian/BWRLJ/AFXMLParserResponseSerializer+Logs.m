#import "AFXMLParserResponseSerializer+Logs.h"
@implementation AFXMLParserResponseSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
