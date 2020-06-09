#import "UIView+SJAnimationAddedLogs.h"
@implementation UIView (SJAnimationAddedLogs)
+ (BOOL)setSjv_disappearedLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)sjv_disappearedLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)setSjv_disappearDirectionLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)sjv_disappearDirectionLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)sjv_disapearLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)sjv_appearLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
