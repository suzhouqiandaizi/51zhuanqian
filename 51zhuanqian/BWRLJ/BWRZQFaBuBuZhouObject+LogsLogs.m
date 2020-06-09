#import "BWRZQFaBuBuZhouObject+LogsLogs.h"
@implementation BWRZQFaBuBuZhouObject (LogsLogs)
+ (BOOL)buzhouItemDicLogsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)initWithDicLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)setContentLogsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
