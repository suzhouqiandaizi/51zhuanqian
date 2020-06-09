#import "WZYUIDatePicker+LogsLogs.h"
@implementation WZYUIDatePicker (LogsLogs)
+ (BOOL)initWithDateDateselectedLogsLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)removePressLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)setUIDatePickerMinimumDateLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)setUIDatePickerMaximumDateLogsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
