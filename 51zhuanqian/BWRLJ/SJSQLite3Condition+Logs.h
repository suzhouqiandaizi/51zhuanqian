#import "SJSQLite3.h"
#import "SJSQLite3+QueryExtended.h"
#import "SJSQLite3TableInfosCache.h"
#import "SJSQLiteErrors.h"

@interface SJSQLite3Condition (Logs)
+ (BOOL)conditionWithColumnValueLogs:(NSInteger)logs;
+ (BOOL)conditionWithColumnRelatedbyValueLogs:(NSInteger)logs;
+ (BOOL)conditionWithColumnInLogs:(NSInteger)logs;
+ (BOOL)conditionWithColumnBetweenAndLogs:(NSInteger)logs;
+ (BOOL)conditionWithIsNullColumnLogs:(NSInteger)logs;
+ (BOOL)initWithConditionLogs:(NSInteger)logs;

@end
