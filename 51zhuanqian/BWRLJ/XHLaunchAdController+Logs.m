#import "XHLaunchAdController+Logs.h"
@implementation XHLaunchAdController (Logs)
+ (BOOL)shouldAutorotateLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)prefersHomeIndicatorAutoHiddenLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
