#import "CustomNavigationCoutroller+Logs.h"
@implementation CustomNavigationCoutroller (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)initWithRootViewControllerLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
