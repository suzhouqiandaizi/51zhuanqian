#import "SJSQLiteTableInfo+Logs.h"
@implementation SJSQLiteTableInfo (Logs)
+ (BOOL)tableInfoWithClassLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)descriptionLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)columnInfoForPropertyLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)columnInfoForColumnNameLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
