#import "UIView+ExtensionsLogs.h"
@implementation UIView (ExtensionsLogs)
+ (BOOL)originLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)setOriginLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)sizeLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setSizeLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)bottomRightLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)bottomLeftLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)topRightLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)heightLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setHeightLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)widthLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)setWidthLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)topLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setTopLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)leftLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setLeftLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)bottomLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)setBottomLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)rightLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setRightLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
