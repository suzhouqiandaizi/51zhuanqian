#import "SJAttributesRangeOperator+Logs.h"
@implementation SJAttributesRangeOperator (Logs)
+ (BOOL)initWithRangeTargetLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)initWithRecorderTargetLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)resetLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)addAttributesToTargetIfNeededLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)removeAttributeWithKeyLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
