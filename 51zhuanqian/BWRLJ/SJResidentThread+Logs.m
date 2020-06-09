#import "SJResidentThread+Logs.h"
@implementation SJResidentThread (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)_runLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)performBlockLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)_performBlockOnResidentThreadLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)_stopLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
