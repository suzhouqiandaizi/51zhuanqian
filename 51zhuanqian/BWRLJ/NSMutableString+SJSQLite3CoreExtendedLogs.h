#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteColumnInfo.h"
#import "SJSQLiteObjectInfo.h"
#import "SJSQLiteCore.h"
#import "SJSQLiteErrors.h"
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteColumnInfo.h"
#import "SJSQLiteObjectInfo.h"

@interface NSMutableString (SJSQLite3CoreExtendedLogs)
+ (BOOL)sjsql_deleteSubffixLogs:(NSInteger)logs;

@end
