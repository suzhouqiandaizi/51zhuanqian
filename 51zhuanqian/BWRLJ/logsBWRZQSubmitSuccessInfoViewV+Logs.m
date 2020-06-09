#import "logsBWRZQSubmitSuccessInfoViewV+Logs.h"
@implementation logsBWRZQSubmitSuccessInfoViewV (Logs)
+ (BOOL)IinitItemLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)EremovePressLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
