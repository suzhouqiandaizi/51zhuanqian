#import "SJPlayerView+Logs.h"
@implementation SJPlayerView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)hitTestWitheventLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)willMoveToWindowLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
