#import "RSADataVerifier+Logs.h"
@implementation RSADataVerifier (Logs)
+ (BOOL)initWithPublicKeyLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)formatPublicKeyLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)verifyStringWithsignWithrsa2Logs:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
