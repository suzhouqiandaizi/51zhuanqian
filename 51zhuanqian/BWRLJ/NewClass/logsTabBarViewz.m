#import "logsTabBarViewz.h"
@implementation logsTabBarViewz
+ (BOOL)ySharedtabbarviewlogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)eInitwithframelogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)ISetcurrentviewcontrollerindexlogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)sDobtnonelogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)pDobtnthreelogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)EDobtnfourlogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)ALoginpresslogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
