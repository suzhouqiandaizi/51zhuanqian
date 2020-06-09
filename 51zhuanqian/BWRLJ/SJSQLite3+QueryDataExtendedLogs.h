#import "SJSQLite3.h"
#import "SJSQLite3+QueryExtended.h"
#import "SJSQLite3TableInfosCache.h"
#import "SJSQLiteErrors.h"

@interface SJSQLite3 (QueryDataExtendedLogs)
+ (BOOL)queryDataForClassResultcolumnsConditionsOrderbyErrorLogs:(NSInteger)logs;
+ (BOOL)queryDataForClassResultcolumnsConditionsOrderbyRangeErrorLogs:(NSInteger)logs;

@end
