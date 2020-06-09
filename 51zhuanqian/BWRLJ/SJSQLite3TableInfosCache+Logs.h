#import <Foundation/Foundation.h>
#import "SJSQLite3TableInfosCache.h"
#import "SJSQLiteTableInfo.h"

@interface SJSQLite3TableInfosCache (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)getTableInfoForClassLogs:(NSInteger)logs;

@end
