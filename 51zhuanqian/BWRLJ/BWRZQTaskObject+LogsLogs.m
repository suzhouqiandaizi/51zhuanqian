#import "BWRZQTaskObject+LogsLogs.h"
@implementation BWRZQTaskObject (LogsLogs)
+ (BOOL)taskItemDicLogsLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)taskDetailDicLogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)initWithDicLogsLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)initWithDetailDicLogsLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)setContentLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)setDetailContentLogsLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
