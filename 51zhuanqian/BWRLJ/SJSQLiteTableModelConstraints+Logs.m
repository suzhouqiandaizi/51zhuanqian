#import "SJSQLiteTableModelConstraints+Logs.h"
@implementation SJSQLiteTableModelConstraints (Logs)
+ (BOOL)initWithClassLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
