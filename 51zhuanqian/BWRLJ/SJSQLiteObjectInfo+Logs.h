#import <Foundation/Foundation.h>
#import "SJSQLiteTableInfo.h"
#import "SJSQLiteObjectInfo.h"
#import "SJSQLiteTableModelConstraints.h"
#import <objc/message.h>

@interface SJSQLiteObjectInfo (Logs)
+ (BOOL)objectInfoWithObjectLogs:(NSInteger)logs;

@end
