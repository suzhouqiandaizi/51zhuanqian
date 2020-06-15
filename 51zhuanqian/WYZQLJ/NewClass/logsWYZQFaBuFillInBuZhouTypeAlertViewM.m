#import "logsWYZQFaBuFillInBuZhouTypeAlertViewM.h"
@implementation logsWYZQFaBuFillInBuZhouTypeAlertViewM
+ (BOOL)CinitItem:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)UremovePress:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)FtuwenPress:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)BwangzhiPress:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)GfuzhiPress:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
