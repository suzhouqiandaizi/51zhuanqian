#import "SharedViewControllers+Logs.h"
@implementation SharedViewControllers (Logs)
+ (BOOL)homeViewConLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)tuiguangViewConLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)personViewConLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
