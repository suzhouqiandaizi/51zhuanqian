#import "UIView+MJExtensionLogs.h"
@implementation UIView (MJExtensionLogs)
+ (BOOL)setMj_xLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)mj_xLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)setMj_yLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)mj_yLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)setMj_wLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)mj_wLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)setMj_hLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)mj_hLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setMj_sizeLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)mj_sizeLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)setMj_originLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)mj_originLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
