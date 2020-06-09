#import "logsSJSQLite3ColumnOrderA.h"
@implementation logsSJSQLite3ColumnOrderA
+ (BOOL)zOrderwithcolumnTAscending:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)oInitwithcolumnvAscending:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
