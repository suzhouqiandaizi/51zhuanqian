#import "SJSQLite3+QueryDataExtendedLogs.h"
@implementation SJSQLite3 (QueryDataExtendedLogs)
+ (BOOL)queryDataForClassResultcolumnsConditionsOrderbyErrorLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)queryDataForClassResultcolumnsConditionsOrderbyRangeErrorLogs:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
