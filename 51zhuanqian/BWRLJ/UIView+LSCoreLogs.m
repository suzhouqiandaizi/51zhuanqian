#import "UIView+LSCoreLogs.h"
@implementation UIView (LSCoreLogs)
+ (BOOL)addRoundedCornersWithradiiLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)addRoundedCornersWithradiiViewrectLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
