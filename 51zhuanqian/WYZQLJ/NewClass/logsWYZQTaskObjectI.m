#import "logsWYZQTaskObjectI.h"
@implementation logsWYZQTaskObjectI
+ (BOOL)aTaskitemdic:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)rTaskdetaildic:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)bInitwithdic:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)XInitwithdetaildic:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)bSetcontent:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)WSetdetailcontent:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
