#import "RSADataSigner+Logs.h"
@implementation RSADataSigner (Logs)
+ (BOOL)initWithPrivateKeyLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)urlEncodedStringLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)formatPrivateKeyLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)signStringWithrsa2Logs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
