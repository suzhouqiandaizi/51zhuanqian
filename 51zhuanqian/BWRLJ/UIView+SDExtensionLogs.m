#import "UIView+SDExtensionLogs.h"
@implementation UIView (SDExtensionLogs)
+ (BOOL)sd_heightLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)setSd_heightLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)sd_widthLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)setSd_widthLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)sd_yLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setSd_yLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)sd_xLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)setSd_xLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
