#import "NSMutableString+SJSQLite3CoreExtendedLogs.h"
@implementation NSMutableString (SJSQLite3CoreExtendedLogs)
+ (BOOL)sjsql_deleteSubffixLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
