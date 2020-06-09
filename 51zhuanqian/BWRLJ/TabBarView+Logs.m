#import "TabBarView+Logs.h"
@implementation TabBarView (Logs)
+ (BOOL)sharedTabBarViewLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)setCurrentViewControllerIndexLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)doBtnOneLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)doBtnThreeLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)doBtnFourLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)loginPressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
