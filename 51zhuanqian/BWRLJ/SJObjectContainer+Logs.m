#import "SJObjectContainer+Logs.h"
@implementation SJObjectContainer (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)countLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)addFlagLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)removeFlagLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)objectForFlagLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)objectAtIndexLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)flagOfObjectAtIndexLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)indexForFlagLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)indexOfObjectLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)removeAllObjectsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
