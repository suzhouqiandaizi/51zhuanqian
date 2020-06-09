#import "logsNSStringm.h"
@implementation logsNSStringm
+ (BOOL)dCalculatemaxwidthwithheightlAttributes:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)sCalculatemaxheightwithwidthKAttributes:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
