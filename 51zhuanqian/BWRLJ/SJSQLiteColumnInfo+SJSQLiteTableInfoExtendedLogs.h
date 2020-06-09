#import <Foundation/Foundation.h>
#import "SJSQLiteColumnInfo.h"
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteTableModelConstraints.h"
#import "SJSQLiteColumnInfo.h"
#import "SJSQLiteCore.h"
#import <objc/message.h>
#import <YYModel/YYClassInfo.h>
#import <YYKit/YYClassInfo.h>

@interface SJSQLiteColumnInfo (SJSQLiteTableInfoExtendedLogs)
+ (BOOL)setAssociatedTableInfoLogs:(NSInteger)logs;
+ (BOOL)associatedTableInfoLogs:(NSInteger)logs;

@end
