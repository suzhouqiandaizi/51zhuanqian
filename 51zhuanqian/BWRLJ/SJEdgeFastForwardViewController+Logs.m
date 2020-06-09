#import "SJEdgeFastForwardViewController+Logs.h"
@implementation SJEdgeFastForwardViewController (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setTriggerAreaWidthLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)blockColorLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)showFastForwardViewLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)leftViewLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)rightViewLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
