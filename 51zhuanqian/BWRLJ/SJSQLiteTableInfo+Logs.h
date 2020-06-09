#import <Foundation/Foundation.h>
#import "SJSQLiteColumnInfo.h"
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteTableModelConstraints.h"
#import "SJSQLiteColumnInfo.h"
#import "SJSQLiteCore.h"
#import <objc/message.h>
#import <YYModel/YYClassInfo.h>
#import <YYKit/YYClassInfo.h>

@interface SJSQLiteTableInfo (Logs)
+ (BOOL)tableInfoWithClassLogs:(NSInteger)logs;
+ (BOOL)descriptionLogs:(NSInteger)logs;
+ (BOOL)columnInfoForPropertyLogs:(NSInteger)logs;
+ (BOOL)columnInfoForColumnNameLogs:(NSInteger)logs;

@end
