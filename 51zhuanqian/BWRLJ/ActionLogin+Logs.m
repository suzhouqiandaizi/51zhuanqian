#import "ActionLogin+Logs.h"
@implementation ActionLogin (Logs)
+ (BOOL)shareActionLoginLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)alertActionLoginWithviewcontrollerHandleLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
