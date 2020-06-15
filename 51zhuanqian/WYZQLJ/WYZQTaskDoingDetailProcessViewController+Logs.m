#import "WYZQTaskDoingDetailProcessViewController+Logs.h"
@implementation WYZQTaskDoingDetailProcessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)requestContentLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)showSumbitPressLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
