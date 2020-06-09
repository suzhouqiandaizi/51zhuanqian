#import "logsBWRZQFaBuFillInBuZhouTypeAlertViewf.h"
@implementation logsBWRZQFaBuFillInBuZhouTypeAlertViewf
+ (BOOL)jinitItem:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)jremovePress:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)stuwenPress:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)qwangzhiPress:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)rfuzhiPress:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
