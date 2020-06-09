#import "logslogsUpdateAlertViewPj.h"
@implementation logslogsUpdateAlertViewPj
+ (BOOL)MBinititemlogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)XRremovepresslogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)LSsurepresslogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
