#import "UIView+SGFrameLogs.h"
@implementation UIView (SGFrameLogs)
+ (BOOL)setSG_xLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)SG_xLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)setSG_yLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)SG_yLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setSG_widthLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)SG_widthLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setSG_heightLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)SG_heightLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)SG_centerXLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)setSG_centerXLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)SG_centerYLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)setSG_centerYLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)setSG_originLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)SG_originLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)setSG_sizeLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)SG_sizeLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)SG_loadViewFromXibLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
