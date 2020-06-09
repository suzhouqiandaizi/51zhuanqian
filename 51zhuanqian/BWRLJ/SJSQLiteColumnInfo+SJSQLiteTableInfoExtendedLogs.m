#import "SJSQLiteColumnInfo+SJSQLiteTableInfoExtendedLogs.h"
@implementation SJSQLiteColumnInfo (SJSQLiteTableInfoExtendedLogs)
+ (BOOL)setAssociatedTableInfoLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)associatedTableInfoLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
