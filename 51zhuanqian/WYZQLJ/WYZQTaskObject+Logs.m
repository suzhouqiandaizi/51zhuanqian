#import "WYZQTaskObject+Logs.h"
@implementation WYZQTaskObject (Logs)
+ (BOOL)taskItemDicLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)taskDetailDicLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)initWithDicLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)initWithDetailDicLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)setContentLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)setDetailContentLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
