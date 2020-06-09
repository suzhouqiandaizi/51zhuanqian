#import "logsBWRZQHomeTaskThreeViewx+Logs.h"
@implementation logsBWRZQHomeTaskThreeViewx (Logs)
+ (BOOL)jInititemLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)JShowcontentLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)xclickPressLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
