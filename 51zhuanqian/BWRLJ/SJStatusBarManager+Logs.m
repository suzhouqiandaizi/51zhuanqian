#import "SJStatusBarManager+Logs.h"
@implementation SJStatusBarManager (Logs)
+ (BOOL)setPreferredStatusBarStyleLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)(void))preferredStatusBarStyleLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setPrefersStatusBarHiddenLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)(void))prefersStatusBarHiddenLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
