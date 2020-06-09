#import "logsBWRZQHomeTaskOneViewa+Logs.h"
@implementation logsBWRZQHomeTaskOneViewa (Logs)
+ (BOOL)wInititemLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)BShowcontentLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)DclickPressLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
