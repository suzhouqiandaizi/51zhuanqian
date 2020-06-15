#import "WYZQTiXianGuangLiViewController+Logs.h"
@implementation WYZQTiXianGuangLiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)viewWillAppearLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)zhifubaoPressLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)weixinPressLogs:(NSInteger)logs {
    return logs % 40 == 0;
}

@end
