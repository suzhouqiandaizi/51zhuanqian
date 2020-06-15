#import "WYZQFaBuBuZhouObject+Logs.h"
@implementation WYZQFaBuBuZhouObject (Logs)
+ (BOOL)buzhouItemDicLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)initWithDicLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)setContentLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
