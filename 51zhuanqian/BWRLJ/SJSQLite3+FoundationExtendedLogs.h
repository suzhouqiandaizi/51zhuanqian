#import "SJSQLite3.h"
#import "SJSQLite3+FoundationExtended.h"
#import "SJSQLiteErrors.h"
#import <YYModel/NSObject+YYModel.h>
#import <YYKit/YYKit.h>

@interface SJSQLite3 (FoundationExtendedLogs)
+ (BOOL)saveForkeyErrorLogs:(NSInteger)logs;
+ (BOOL)removeValueForKeyErrorLogs:(NSInteger)logs;
+ (BOOL)stringForKeyLogs:(NSInteger)logs;
+ (BOOL)arrayForKeyLogs:(NSInteger)logs;
+ (BOOL)jsonStringForKeyLogs:(NSInteger)logs;
+ (BOOL)dictionaryForKeyLogs:(NSInteger)logs;
+ (BOOL)integerForKeyLogs:(NSInteger)logs;
+ (BOOL)floatForKeyLogs:(NSInteger)logs;
+ (BOOL)doubleForKeyLogs:(NSInteger)logs;
+ (BOOL)boolForKeyLogs:(NSInteger)logs;
+ (BOOL)URLForKeyLogs:(NSInteger)logs;
+ (BOOL)_containerValueForKeyLogs:(NSInteger)logs;
+ (BOOL)_itemValueForKeyLogs:(NSInteger)logs;

@end
