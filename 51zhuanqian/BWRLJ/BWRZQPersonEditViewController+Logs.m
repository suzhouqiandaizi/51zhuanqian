#import "BWRZQPersonEditViewController+Logs.h"
@implementation BWRZQPersonEditViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)viewDidAppearLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)cancelPressLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)finishPressLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
