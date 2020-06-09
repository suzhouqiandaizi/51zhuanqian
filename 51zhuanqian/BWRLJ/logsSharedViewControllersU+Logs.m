#import "logsSharedViewControllersU+Logs.h"
@implementation logsSharedViewControllersU (Logs)
+ (BOOL)ehomeViewConLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)ktuiguangViewConLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)zpersonViewConLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
