#import "logsNSDatab.h"
@implementation logsNSDatab
+ (BOOL)VDatawithbase64Encodedstring:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)GInitwithbase64Encodedstring:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)rbase64Encoding:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)lBase64Encodingwithlinelength:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
