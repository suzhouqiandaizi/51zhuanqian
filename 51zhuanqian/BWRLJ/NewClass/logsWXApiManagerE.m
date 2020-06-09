#import "logsWXApiManagerE.h"
@implementation logsWXApiManagerE
+ (BOOL)nsharedManager:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)fdealloc:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)POnresp:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)YOnreq:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
