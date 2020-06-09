#import "BWRZQTiXianGuangLiViewController+LogsLogs.h"
@implementation BWRZQTiXianGuangLiViewController (LogsLogs)
+ (BOOL)viewDidLoadLogsLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)viewWillAppearLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)zhifubaoPressLogsLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)weixinPressLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
