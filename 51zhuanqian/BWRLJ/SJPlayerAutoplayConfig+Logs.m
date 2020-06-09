#import "SJPlayerAutoplayConfig+Logs.h"
@implementation SJPlayerAutoplayConfig (Logs)
+ (BOOL)configWithPlayerSuperviewTagAutoplaydelegateLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
