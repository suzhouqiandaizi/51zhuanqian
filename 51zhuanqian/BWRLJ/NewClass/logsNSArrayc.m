#import "logsNSArrayc.h"
@implementation logsNSArrayc
+ (BOOL)msortedArrayByTag:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)PsortedArrayByPosition:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
