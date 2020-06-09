#import "logsXHLaunchImageViewt.h"
@implementation logsXHLaunchImageViewt
+ (BOOL)PInitwithsourcetype:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)QimageFromLaunchImage:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)kimageFromLaunchScreen:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)gImagefromview:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)LLaunchimagewithtype:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
