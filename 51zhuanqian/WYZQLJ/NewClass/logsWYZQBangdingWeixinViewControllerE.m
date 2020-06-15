#import "logsWYZQBangdingWeixinViewControllerE.h"
@implementation logsWYZQBangdingWeixinViewControllerE
+ (BOOL)gviewDidLoad:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)TsurePress:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
