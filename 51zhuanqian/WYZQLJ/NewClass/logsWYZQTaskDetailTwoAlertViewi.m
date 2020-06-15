#import "logsWYZQTaskDetailTwoAlertViewi.h"
@implementation logsWYZQTaskDetailTwoAlertViewi
+ (BOOL)sinitItem:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)rremovePress:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)zsurePress:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)JneverShowPress:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
