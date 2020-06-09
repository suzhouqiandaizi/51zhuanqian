#import "SJSQLite3.h"
#import "SJSQLite3+QueryExtended.h"
#import "SJSQLite3TableInfosCache.h"
#import "SJSQLiteErrors.h"

@interface SJSQLite3ColumnOrder (Logs)
+ (BOOL)orderWithColumnAscendingLogs:(NSInteger)logs;
+ (BOOL)initWithColumnAscendingLogs:(NSInteger)logs;

@end
