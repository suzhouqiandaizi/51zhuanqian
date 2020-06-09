#import "logsBWRZQBangdingWeixinViewControllerK.h"
@implementation logsBWRZQBangdingWeixinViewControllerK
+ (BOOL)LviewDidLoad:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)csurePress:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
