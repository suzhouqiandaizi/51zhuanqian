#import "UIView+HYHExtensionLogs.h"
@implementation UIView (HYHExtensionLogs)
+ (BOOL)yh_xLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)setYh_xLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)yh_yLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)setYh_yLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setYh_widthLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)yh_widthLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)setYh_heightLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)yh_heightLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)yh_sizeLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)setYh_sizeLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)yh_originLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)setYh_originLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
