#import "SJRouter+Logs.h"
@implementation SJRouter (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)handleRequestCompletionhandlerLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)canHandleRoutePathLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
