#import "logsNSDatad.h"
@implementation logsNSDatad
+ (BOOL)tDatawithbase64Encodedstring:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)GBase64Encodedstringwithwrapwidth:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)Ubase64EncodedString:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
