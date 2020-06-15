#import "WYZQPersonEditViewController+Logs.h"
@implementation WYZQPersonEditViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)viewDidAppearLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)cancelPressLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)finishPressLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
