#import "logsTabBarViewm.h"
@implementation logsTabBarViewm
+ (BOOL)OsharedTabBarView:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)lInitwithframe:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)xSetcurrentviewcontrollerindex:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)KDobtnone:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)TDobtnthree:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)sDobtnfour:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)yloginPress:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
