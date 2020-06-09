#import "logsBWRZQFaBuFillInBuZhouTypeAlertViewe.h"
@implementation logsBWRZQFaBuFillInBuZhouTypeAlertViewe
+ (BOOL)bInititemlogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)dRemovepresslogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)zTuwenpresslogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)LWangzhipresslogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)QFuzhipresslogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
