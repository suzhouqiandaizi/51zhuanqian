#import "logsUINavigationControllerR.h"
@implementation logsUINavigationControllerR
+ (BOOL)lsj_containsPlayerView:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
