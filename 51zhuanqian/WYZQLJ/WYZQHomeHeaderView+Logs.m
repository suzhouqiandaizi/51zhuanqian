#import "WYZQHomeHeaderView+Logs.h"
@implementation WYZQHomeHeaderView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)morePressLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)twoBtnPressLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)setBannersLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)cycleScrollViewDidselectitematindexLogs:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
