#import "BWRZQTiXianGuangLiViewController+Logs.h"
@implementation BWRZQTiXianGuangLiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)viewWillAppearLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)zhifubaoPressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)weixinPressLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
