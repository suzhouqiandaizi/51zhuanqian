#import "SJQueue+Logs.h"
@implementation SJQueue (Logs)
+ (BOOL)queueLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)enqueueLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)dequeueLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)emptyLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
