#import "logsRSADataVerifierK.h"
@implementation logsRSADataVerifierK
+ (BOOL)CInitwithpublickey:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)JFormatpublickey:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)tVerifystringSWithsignYWithrsa2:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
