#import "logsWYZQTiXianGuangLiViewControllers.h"
@implementation logsWYZQTiXianGuangLiViewControllers
+ (BOOL)KviewDidLoad:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)cViewwillappear:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)RzhifubaoPress:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)QweixinPress:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
