#import "SJSQLite3TableInfosCache+Logs.h"
@implementation SJSQLite3TableInfosCache (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)getTableInfoForClassLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
