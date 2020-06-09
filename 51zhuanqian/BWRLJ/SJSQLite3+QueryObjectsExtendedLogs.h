#import "SJSQLite3.h"
#import "SJSQLite3+QueryExtended.h"
#import "SJSQLite3TableInfosCache.h"
#import "SJSQLiteErrors.h"

@interface SJSQLite3 (QueryObjectsExtendedLogs)
+ (BOOL)objectsForClassConditionsOrderbyErrorLogs:(NSInteger)logs;
+ (BOOL)objectsForClassConditionsOrderbyRangeErrorLogs:(NSInteger)logs;
+ (BOOL)countOfObjectsForClassConditionsErrorLogs:(NSInteger)logs;
+ (BOOL)_rowDataForClassResultcolumnsConditionsOrderbyRangeErrorLogs:(NSInteger)logs;

@end
