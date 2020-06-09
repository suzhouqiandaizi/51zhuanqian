#import "logsBWRZQTaskObjectY+Logs.h"
@implementation logsBWRZQTaskObjectY (Logs)
+ (BOOL)tTaskitemdicLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)gTaskdetaildicLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)mInitwithdicLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)JInitwithdetaildicLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)ISetcontentLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)GSetdetailcontentLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
