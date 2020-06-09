#import "SJSQLiteColumnInfo+Logs.h"
@implementation SJSQLiteColumnInfo (Logs)
+ (BOOL)descriptionLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)copyWithZoneLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
