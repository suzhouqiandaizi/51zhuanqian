#import "logsUserInfoS.h"
@implementation logsUserInfoS
+ (BOOL)WInitlogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)YEncodewithcoderlogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)KInitwithcoderlogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
