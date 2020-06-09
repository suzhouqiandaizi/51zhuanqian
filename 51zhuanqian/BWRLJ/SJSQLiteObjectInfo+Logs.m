#import "SJSQLiteObjectInfo+Logs.h"
@implementation SJSQLiteObjectInfo (Logs)
+ (BOOL)objectInfoWithObjectLogs:(NSInteger)logs {
    return logs % 40 == 0;
}

@end
