#import "SJSQLite3Condition+Logs.h"
@implementation SJSQLite3Condition (Logs)
+ (BOOL)conditionWithColumnValueLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)conditionWithColumnRelatedbyValueLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)conditionWithColumnInLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)conditionWithColumnBetweenAndLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)conditionWithIsNullColumnLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)initWithConditionLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
