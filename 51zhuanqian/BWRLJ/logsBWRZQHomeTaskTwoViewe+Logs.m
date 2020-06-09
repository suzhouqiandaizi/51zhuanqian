#import "logsBWRZQHomeTaskTwoViewe+Logs.h"
@implementation logsBWRZQHomeTaskTwoViewe (Logs)
+ (BOOL)LInititemLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)fShowcontentLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)RclickPressLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
