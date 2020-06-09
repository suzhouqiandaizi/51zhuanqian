#import "logsUITabBarControllerl.h"
@implementation logsUITabBarControllerl
+ (BOOL)esj_containsPlayerView:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
