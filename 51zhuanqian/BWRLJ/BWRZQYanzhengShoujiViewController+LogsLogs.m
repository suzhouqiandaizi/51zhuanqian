#import "BWRZQYanzhengShoujiViewController+LogsLogs.h"
@implementation BWRZQYanzhengShoujiViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)surePressLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)codePressLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)getPhoneCodeLogsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)updateTimeLogsLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
