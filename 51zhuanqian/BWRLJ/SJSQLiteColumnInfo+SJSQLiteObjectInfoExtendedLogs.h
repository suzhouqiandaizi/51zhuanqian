#import <Foundation/Foundation.h>
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteObjectInfo.h"
#import "SJSQLiteTableModelConstraints.h"
#import <objc/message.h>

@interface SJSQLiteColumnInfo (SJSQLiteObjectInfoExtendedLogs)
+ (BOOL)setAssociatedObjectInfosLogs:(NSInteger)logs;
+ (BOOL)associatedObjectInfosLogs:(NSInteger)logs;

@end
