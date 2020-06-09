#import "SJSQLiteColumnInfo+SJSQLiteObjectInfoExtendedLogs.h"
@implementation SJSQLiteColumnInfo (SJSQLiteObjectInfoExtendedLogs)
+ (BOOL)setAssociatedObjectInfosLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)associatedObjectInfosLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
