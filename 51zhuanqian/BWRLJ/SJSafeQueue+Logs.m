#import "SJSafeQueue+Logs.h"
@implementation SJSafeQueue (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)enqueueLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)dequeueLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)emptyLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
