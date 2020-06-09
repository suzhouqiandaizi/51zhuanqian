#import "logsUIViewControllerI.h"
@implementation logsUIViewControllerI
+ (BOOL)YHUD:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)FSethud:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)kShowhudalert:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)ELoadinghudalert:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)kLoadinghudalertNWithview:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)GhideHudAlert:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)PLoadinghudalerttowindow:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
