#import "SJAttributeWorker+RegexpLogs.h"
@implementation SJAttributeWorker (RegexpLogs)
+ (BOOL)setRegexpOptionsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)regexpOptionsLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)(NSString * _Nonnull, void (^ _Nonnull)(SJAttributesRangeOperator * _Nonnull)))regexpLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)(NSString * _Nonnull, void (^ _Nonnull)(NSArray<NSValue *> * _Nonnull), BOOL reverse))regexp_rLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)(NSString * _Nonnull, id _Nonnull, ...))regexp_replaceLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)(NSString * _Nonnull, SJAttributeRegexpInsertPosition, id _Nonnull, ...))regexp_insertLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
