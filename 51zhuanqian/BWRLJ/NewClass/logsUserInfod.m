#import "logsUserInfod.h"
@implementation logsUserInfod
+ (BOOL)Winit:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)UEncodewithcoder:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)xInitwithcoder:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
