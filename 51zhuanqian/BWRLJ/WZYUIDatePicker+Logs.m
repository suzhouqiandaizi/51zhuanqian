#import "WZYUIDatePicker+Logs.h"
@implementation WZYUIDatePicker (Logs)
+ (BOOL)initWithDateDateselectedLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)setUIDatePickerMinimumDateLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)setUIDatePickerMaximumDateLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
