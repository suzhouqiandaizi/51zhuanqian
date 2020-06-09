#import "BWRZQHomeHeaderView+Logs.h"
@implementation BWRZQHomeHeaderView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)morePressLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)twoBtnPressLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)setBannersLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)cycleScrollViewDidselectitematindexLogs:(NSInteger)logs {
    return logs % 47 == 0;
}

@end
