#import "logsCustomNavigationCoutrollerV+Logs.h"
@implementation logsCustomNavigationCoutrollerV (Logs)
+ (BOOL)DinitLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)xInitwithrootviewcontrollerLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
