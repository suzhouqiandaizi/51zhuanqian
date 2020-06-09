#import "BWRZQTaskDoingDetailProcessViewController+Logs.h"
@implementation BWRZQTaskDoingDetailProcessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)requestContentLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)showSumbitPressLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
