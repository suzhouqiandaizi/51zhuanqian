#import "SJSQLiteCore.h"
#import "SJSQLiteTableModelProtocol.h"
#import <sqlite3.h>
#import "SJSQLite3.h"
#import "SJSQLite3TableInfosCache.h"
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteObjectInfo.h"
#import "SJSQLiteErrors.h"
#import "SJSQLiteCore.h"
#import <objc/message.h>
#import <stdlib.h>
#import <YYModel/NSObject+YYModel.h>
#import <YYKit/YYKit.h>

@interface SJSQLite3 (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)initWithDatabasePathLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)saveErrorLogs:(NSInteger)logs;
+ (BOOL)saveObjectsErrorLogs:(NSInteger)logs;
+ (BOOL)updateForkeysErrorLogs:(NSInteger)logs;
+ (BOOL)updateForkeyErrorLogs:(NSInteger)logs;
+ (BOOL)objectForClassPrimarykeyvalueErrorLogs:(NSInteger)logs;
+ (BOOL)removeAllObjectsForClassErrorLogs:(NSInteger)logs;
+ (BOOL)removeObjectForClassPrimarykeyvalueErrorLogs:(NSInteger)logs;
+ (BOOL)removeObjectsForClassPrimarykeyvaluesErrorLogs:(NSInteger)logs;
+ (BOOL)execErrorLogs:(NSInteger)logs;
+ (BOOL)execInTransactionErrorLogs:(NSInteger)logs;
+ (BOOL)objectsForClassRowdatasErrorLogs:(NSInteger)logs;
+ (BOOL)_tableExistsLogs:(NSInteger)logs;
+ (BOOL)_alterTableIfNeededLogs:(NSInteger)logs;
+ (BOOL)_createTableLogs:(NSInteger)logs;
+ (BOOL)_checkoutTableLogs:(NSInteger)logs;
+ (BOOL)_updateForkeysLogs:(NSInteger)logs;
+ (BOOL)_insertOrUpdateObjectsLogs:(NSInteger)logs;
+ (BOOL)_insertOrUpdateObjectLogs:(NSInteger)logs;
+ (BOOL)_transformRowDataToobjectofclassErrorLogs:(NSInteger)logs;

@end
