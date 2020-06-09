#import "logsBWRZQTaskObjectc+Logs.h"
@implementation logsBWRZQTaskObjectc (Logs)
+ (BOOL)fTaskitemdiclogsLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)STaskdetaildiclogsLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)EInitwithdiclogsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)RInitwithdetaildiclogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)KSetcontentlogsLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)zSetdetailcontentlogsLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
