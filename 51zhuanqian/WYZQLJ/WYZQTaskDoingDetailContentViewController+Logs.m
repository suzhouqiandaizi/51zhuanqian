#import "WYZQTaskDoingDetailContentViewController+Logs.h"
@implementation WYZQTaskDoingDetailContentViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)stepTapActionLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)requirementTapActionLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)lineCilicActionLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)guanzhuPressLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
