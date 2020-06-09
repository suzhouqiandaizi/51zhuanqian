#import "logsBWRZQTaskDetailTwoAlertViewn.h"
@implementation logsBWRZQTaskDetailTwoAlertViewn
+ (BOOL)yinitItem:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)gremovePress:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)bsurePress:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)IneverShowPress:(NSInteger)logs {
    return logs % 40 == 0;
}

@end
