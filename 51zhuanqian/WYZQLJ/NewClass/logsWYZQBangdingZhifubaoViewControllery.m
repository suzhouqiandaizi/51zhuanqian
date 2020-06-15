#import "logsWYZQBangdingZhifubaoViewControllery.h"
@implementation logsWYZQBangdingZhifubaoViewControllery
+ (BOOL)gviewDidLoad:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)lsurePress:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
