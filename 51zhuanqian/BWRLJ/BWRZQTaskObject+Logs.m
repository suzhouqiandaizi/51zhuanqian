#import "BWRZQTaskObject+Logs.h"
@implementation BWRZQTaskObject (Logs)
+ (BOOL)taskItemDicLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)taskDetailDicLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)initWithDicLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)initWithDetailDicLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)setContentLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)setDetailContentLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
