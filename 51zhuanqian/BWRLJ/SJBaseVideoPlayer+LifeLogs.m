#import "SJBaseVideoPlayer+LifeLogs.h"
@implementation SJBaseVideoPlayer (LifeLogs)
+ (BOOL)vc_viewDidAppearLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)vc_viewWillDisappearLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)vc_viewDidDisappearLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)vc_prefersStatusBarHiddenLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)vc_preferredStatusBarStyleLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)setVc_isDisappearedLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)vc_isDisappearedLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)needShowStatusBarLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)needHiddenStatusBarLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
