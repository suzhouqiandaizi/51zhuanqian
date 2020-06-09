#import "UIViewController+customLogs.h"
@implementation UIViewController (customLogs)
+ (BOOL)addBackBtnLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)addLeftBtnLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)addRigthBtnLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)addRigthBtnWithbuttoncolorLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)addRigthBtnImageLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)addRigthBtnImageWithbadgeCompleteLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)addBackBtnTitleLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)addRigthBtnTitleWithbadgeCompleteLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)goBackActionLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
