#import "logslogsWZYForeNotificationAp.h"
@implementation logslogsWZYForeNotificationAp
+ (BOOL)aHhandleremotenotificationsoundidlogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)xLhandleremotenotificationcustomsoundlogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)KPshowbannerwithuserinfosoundidlogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)NIapprootviewcontrollerlogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)SGdeletwzyannerlogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
