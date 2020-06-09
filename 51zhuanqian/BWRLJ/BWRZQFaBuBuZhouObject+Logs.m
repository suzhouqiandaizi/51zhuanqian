#import "BWRZQFaBuBuZhouObject+Logs.h"
@implementation BWRZQFaBuBuZhouObject (Logs)
+ (BOOL)buzhouItemDicLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)initWithDicLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)setContentLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
