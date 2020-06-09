#import "SJSQLite3ColumnOrder+Logs.h"
@implementation SJSQLite3ColumnOrder (Logs)
+ (BOOL)orderWithColumnAscendingLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)initWithColumnAscendingLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
